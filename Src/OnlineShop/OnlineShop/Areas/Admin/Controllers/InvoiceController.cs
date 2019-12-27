using Model.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class InvoiceController : Controller
    {
        // GET: Admin/Invoice
        public ActionResult Index(int? mahd=null,string tenkh="",string sdt="",string email="",string createDate="",int? status=null,string fromDate="",string toDate="")
        {
            SetInvoiceStatusViewBag();

            if (!String.IsNullOrEmpty(fromDate))
                fromDate = Convert.ToDateTime(fromDate).ToString("MM/dd/yyyy");
       
            if (!String.IsNullOrEmpty(toDate))
                toDate = Convert.ToDateTime(toDate).ToString("MM/dd/yyyy");
        
            ViewBag.MaHD = mahd;
            ViewBag.Name = tenkh;
            ViewBag.SDT = sdt;
            ViewBag.Email = email;
            var model = new OrderDao().GetListInvoice(mahd,tenkh,sdt,email,createDate,status,fromDate,toDate);
            return View(model);
        }

        public ActionResult Detail(long ID)
        {
            var model = new OrderDao().ViewDetail(ID);

            return View(model);
        }


        void SetStatusViewBag()
        {
            ViewBag.Status = new SelectList(new[]
              {
                                    new { ID="1", Status="Chờ duyệt" },
                                    new { ID="2", Status="Đã duyệt" },
                                    new { ID="3", Status="Vận chuyển " },
                                    new { ID="4", Status="Thành công" },
                                    new { ID="5", Status="Hủy đơn" },
               }, "ID", "Status", true);

        }


        void SetInvoiceStatusViewBag()
        {
            ViewBag.Invoice = new SelectList(new[]
              {
                                    new { ID="1", Status="Chờ duyệt" },
                                    new { ID="2", Status="Đã duyệt" },
                                    new { ID="3", Status="Vận chuyển " },
                                    new { ID="4", Status="Hoàn thành" },
                                    new { ID="5", Status="Hủy đơn" },
               }, "ID", "Status", true);

        }


        [HttpGet]
        public ActionResult ChangeStatus(long ID,long status)
        {
            var dao = new OrderDao();
            var pdao = new ProductDao();
            var order = dao.Detail(ID);
            var oDetail = new OrderDetailDao().ListAllByOrder(ID);
            order.Status = (int)status;
            dao.ChangeStatus(order);
            if (status==5)
            {
                foreach (var item in oDetail)
                {
                    var product = pdao.Detail(item.ProductID);
                    product.Quantity += item.Quantity.Value;
                    pdao.ChangeQuantity(product);
                }
            }
            var model = dao.GetListInvoice();
            SetInvoiceStatusViewBag();
            return RedirectToAction("Index", "Invoice", model);
        }
        
    

    }


}