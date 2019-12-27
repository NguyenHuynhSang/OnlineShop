using Model.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class StatisticalController : BaseController
    {
        // GET: Admin/Statistical
        public ActionResult Index(string fromDate = "", string toDate = "")
        {
            var dao = new OrderDao();

            if (!String.IsNullOrEmpty(fromDate))
                fromDate = Convert.ToDateTime(fromDate).ToString("MM/dd/yyyy");
            else
            {
                fromDate = "01/01/2019";
            }
            if (!String.IsNullOrEmpty(toDate))
                toDate = Convert.ToDateTime(toDate).ToString("MM/dd/yyyy");
            else
            {
                toDate = "12/01/2100";
            }
            var model = dao.GetRevenueStatistic(fromDate, toDate);
            ViewBag.FromDate = fromDate;
            ViewBag.ToDate = toDate;

            SetAlert("Load thành công", "success");
            return View(model);
        }
    }
}