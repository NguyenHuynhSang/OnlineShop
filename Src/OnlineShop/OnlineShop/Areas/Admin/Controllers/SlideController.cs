using Model.Dao;
using Model.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class SlideController : BaseController
    {
        // GET: Admin/Slide
     
        public ActionResult Index(string name = "",bool? status=null)
        {
            ViewBag.Name = name;

            SetStatusViewBag();
            var dao = new SlideDao().ListAllForAdmin(name,status);

            SetAlert("Load thành công", "success");
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
            slide.Status = false;
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
                    SetAlert("Thêm không thành công", "error");
                }



            }
            else
            {
                ModelState.AddModelError("", "Form lỗi");
                SetAlert("Form lỗi", "error");
            }

            return View("Create");
        }


        public ActionResult Edit(long id)
        {
          
            var slide = new SlideDao().ViewDetail(id);
            return View(slide);
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
                    SetAlert("Cập nhật không thành công", "error");
                }
            }
            return View("Edit");
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