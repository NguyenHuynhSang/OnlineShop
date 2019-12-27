using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.Dao;
using Model.EntityFramework;
using System.Threading.Tasks;
using OnlineShop.Common;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class ContentController : Controller
    {
        // GET: Admin/Content
        public ActionResult Index(string name,string title, int page = 1, int pageSize = 10)
        {
            
            var dao = new ContentDao();
            var model = dao.ListAllPaging(name,title, page, pageSize);
            SetViewBag();
            ViewBag.name = name;
            ViewBag.title = title;
       
            return View(model);
        }

        [HttpGet]
        public ActionResult Create()
        {
            SetViewBag();
            return View();
        }

        [HttpGet]
        public ActionResult Edit(long id)
        {
            var dao = new ContentDao();
            var content = dao.GetByID(id);

            SetViewBag(content.CategoryID);

            return View(content);
        }

        [HttpPost]
        public ActionResult Edit(Content content)
        {
            SetViewBag();
            var dao = new ContentDao();
            var model = dao.ListAllPaging(1,10);
            if (ModelState.IsValid)
            {

                var result = dao.update(content);

                if (result)
                {
                    return RedirectToAction("Index", "Content", model);
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật không thành công");
                }
            }
            return View("Edit");
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(Content model)
        {
            if (ModelState.IsValid)
            {    
                var session = (UserLogin)Session[CommonConstants.USER_SESSTION];
                model.CreatedBy = session.UserName;
                new ContentDao().Create(model);
                return RedirectToAction("Index");
            }
            SetViewBag();
            return View();
        }


        public void SetViewBag(long? selectedId = null)
        {
            var dao = new CategoriesDao();
            ViewBag.CategoryID = new SelectList(dao.ListAll(), "ID", "Name", selectedId);
        }

        public void SetViewBagCategory(long? selectedId = null)
        {
            var dao = new CategoriesDao();
            ViewBag.CategoryID = dao.ListAll();
        }

        [HttpGet]
        [HaveCredential(RoleID = "VIEW_USER")]
        public ActionResult ViewDetail(long id)
        {

            var account = new ContentDao().GetByID(id);
            return View(account);
        }
    }
}