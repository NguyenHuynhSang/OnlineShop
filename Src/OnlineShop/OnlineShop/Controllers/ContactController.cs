using Model.Dao;
using Model.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Controllers
{
    public class ContactController : Controller
    {
        // GET: Contact
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]

        public JsonResult Send(string name, string email, string tieude, string content)
        {
            var feedback = new Feedback();
            feedback.Name = name;
            feedback.Email = email;
            feedback.Phone = tieude;
            feedback.Content = content;
            feedback.CreatedDate = DateTime.Now;
            feedback.Status = true;

            var id = new ContactDao().InsertFeedBack(feedback);
            if (id > 0)
            {
                return Json(new
                {
                    status = true
                });


            }
            else
            {
                return Json(new
                {
                    status = false
                });
            }
        }
    }
}