using Model.Dao;
using Model.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class SlideController : Controller
    {
        // GET: Admin/Slide
     
        public ActionResult Index(string name = "",bool? status=null)
        {
            ViewBag.Name = name;

            SetStatusViewBag();
            var dao = new SlideDao().ListAllForAdmin(name,status);
            return View(dao);
        }

        [HttpGet]
        public ActionResult ChangeProductStatus(long id)
        {
            var dao = new SlideDao().ChangeStatus(id);
            var result = new SlideDao().ListAllForAdmin();
            return RedirectToAction("Index", "Slide", result);

        }

        [HttpGet]
        public ActionResult Create()
        {
            var slide = new Slide();
         
            return View(slide);
        }



        [HttpPost, ValidateInput(false)]
        public ActionResult Create(Slide slide)
        {
            var dao = new SlideDao();

      
            if (ModelState.IsValid)
            {
               
                long id = dao.Insert(slide);
                if (id > 0)
                {

                    // chuyển hướng trang về admin/slide/index
                    var result = dao.ListAllForAdmin();
                    return RedirectToAction("Index", "Slide", result);
                }
                else
                {
                    ModelState.AddModelError("", "Thêm không thành công");
                }



            }
            else
            {
                ModelState.AddModelError("", "Form lỗi");
            }

            return View("Create");
        }

        void SetStatusViewBag()
        {
            ViewBag.Status = new SelectList(new[]
                             {
                                    new { ID="false", Status="Đã ẩn" },
                                    new { ID="true", Status="Hiển thị" },
                                }, "ID", "Status", true);

        }

        [HttpPost]
        public JsonResult ChangeStatus(long id)
        {
            var result = new SlideDao().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
    }
}