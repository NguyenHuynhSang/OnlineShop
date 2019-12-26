using Model.Dao;
using Model.EntityFramework;
using Model.Extend;
using Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class UserGroupController : Controller
    {
        // GET: Admin/UserGroup
        [HttpGet]
        public ActionResult Index()
        {
            List<TreeViewNode> nodes = new List<TreeViewNode>();
   
            var dao = new UserGroupDao();
            var entities = dao.GetUserGroups();
            

            //Loop and add the Parent Nodes.
            foreach (UserGroup type in entities)
            {
        
                   nodes.Add(new TreeViewNode { id = type.ID.ToString(), parent = "#", text = type.Name });
                
            }


            var childEntity = dao.GetRoleByGroup();

            // Loop and add the Child Nodes.
            foreach (UserRoleByGroupModel subType in childEntity)
            {
            
              nodes.Add(new TreeViewNode { id =subType.role.ID.ToString(), parent = subType.userGroup.ID.ToString(), text = subType.role.Name });
           

            }

            //Serialize to JSON string.
            ViewBag.Json = (new JavaScriptSerializer()).Serialize(nodes);
            return View();
        }

        [HttpPost]
        public ActionResult DeleteRole(string selectedItems)
        {
            List<TreeViewNode> items = (new JavaScriptSerializer()).Deserialize<List<TreeViewNode>>(selectedItems);
            return RedirectToAction("Index");
        }




        [HttpGet]
        public ActionResult Create()
        {
            var dao = new RolesDao();
            var items = dao.GetListRoles();
            var model = new RoleSelectViewModel();
            ViewBag.ListRole = items.Select(x => new SelectListItem
            {
                Value = x.ID,
                Text = "item " + x.Name,
                Selected = true
            }) ;
           
            return View(model);
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult Create(RoleSelectViewModel  slide)
        {
            var dao = new SlideDao();


          
            return View("Create");
        }

        public ActionResult Edit(string id)
        {

            //var group = new UserGroupDao().ViewDetail(id);
            //var model = new RoleSelectViewModel();
            //var items = dao.GetListRoles();
            //ViewBag.ListRole = items.Select(x => new SelectListItem
            //{
            //    Value = x.ID,
            //    Text = "item " + x.Name
            //});

            return View();
        }


        [HttpPost, ValidateInput(false)]

        public ActionResult Edit(Slide product)
        {
            var dao = new SlideDao();
            var model = dao.ListAllForAdmin();
            if (ModelState.IsValid)
            {

                var result = dao.Update(product);

                if (result)
                {
                    return RedirectToAction("Index", "Slide", model);
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật không thành công");
                }
            }
            return View("Edit");
        }


    }

}