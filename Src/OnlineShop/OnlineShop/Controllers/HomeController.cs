using Model.Dao;
using OnlineShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Controllers
{
  
    public class HomeController : Controller
    {
       
        // GET: Home
        public ActionResult Index()
        {
            var dao = new ProductDao();
            ViewBag.BestSell= dao.ListBestSellingProduct(10);
            ViewBag.NewProducts = dao.ListNewProduct(5);
            ViewBag.HotProducts = dao.ListHotProduct(20);
            ViewBag.Contents = new ContentDao().ListNewContent(5);
            ViewBag.PromotionProducts= dao.ListPromotionProduct(5);
            return View();
        }


        [ChildActionOnly]

        public ActionResult MainMenu()
        {
            var model = new MenuDao().ListByGroupId(1);
            return PartialView(model);
        }

        [ChildActionOnly]
        public ActionResult Slide()
        {
            var model = new SlideDao().ListAll();
            return PartialView(model);
        }

        [ChildActionOnly]
        public ActionResult HomeCart()
        {
            var cart = Session[Common.CommonConstants.CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {

                list = (List<CartItem>)cart;
            }

            return PartialView(list);
        }

        [ChildActionOnly]
        public ActionResult ProductCategory()
        {
            var model = new ProductCategoryDao().ListAll();
            return PartialView(model);
        }


        [HttpPost]
        public JsonResult Update(long id)
        {
            var product = new ProductDao().ViewDetail(id);
            var cart = Session[Common.CommonConstants.CartSession];
            if (cart != null)
            {
                var list = (List<CartItem>)cart;


                if (list.Exists(x => x.Product.ID == id))
                {
                    foreach (var item in list)
                    {
                        if (item.Product.ID == id)
                        {
                            item.Quantity += 1;
                        }
                    }
                }
                else
                {
                    var item = new CartItem();
                    item.Product = product;
                    item.Quantity = 1;
                    list.Add(item);
                }

            }
            else
            {
                var item = new CartItem();
                item.Product = product;
                item.Quantity = 1;
                var list = new List<CartItem>();
                list.Add(item);
                Session[Common.CommonConstants.CartSession] = list;
            }

            return Json(new
            {
                status = true
            });
        }
    }
}