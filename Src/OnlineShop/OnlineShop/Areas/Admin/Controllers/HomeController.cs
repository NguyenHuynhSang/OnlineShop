using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class HomeController : BaseController
    {
        // GET: Admin/Home
        public ActionResult Index(string key1="Điện thoại",string key2="")
        {

            ViewBag.Key1 = key1;
            ViewBag.key2 = key2;
            return View();
        }

        //Set Bootstrap Alert cho website
      
    }
}