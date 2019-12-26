using Model.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class MenuController : Controller
    {
        // GET: Admin/Menu
        public ActionResult Index()
        {
            SetStatusViewBag();
            var dao = new MenuDao();
            var model=dao.ListAll();
            return View(model);
        }

        void SetStatusViewBag()
        {
            ViewBag.Status = new SelectList(new[]
                             {
                                    new { ID="false", Status="Đã ẩn" },
                                    new { ID="true", Status="Hiển thị" },
                                }, "ID", "Status", true);

        }
    }
}