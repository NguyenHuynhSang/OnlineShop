﻿using Model.Dao;
using OnlineShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OnlineShop.Common;
using System.Web.Script.Serialization;
using Model.EntityFramework;

namespace OnlineShop.Controllers
{
    public class CartController : Controller
    {

     
        // GET: Cart
        public ActionResult Index()
        {
            var cart = Session[Common.CommonConstants.CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                 list = (List<CartItem>)cart;
            }
   
                return View(list);
        }


        public ActionResult AddItem(long productId,int quantity)
        {
            var product = new ProductDao().ViewDetail(productId);
            var cart = Session[Common.CommonConstants.CartSession];
            if (cart != null)
            {
                var list = (List<CartItem>)cart;


                if (list.Exists(x=>x.Product.ID==productId))
                {
                    foreach (var item in list)
                    {
                        if ( item.Product.ID == productId)
                        {
                            item.Quantity += quantity;
                        }
                    }
                }
                else
                {
                    var item = new CartItem();
                    item.Product = product;
                    item.Quantity = quantity;
                    list.Add(item);
                }
            
            }
            else
            {
                var item = new CartItem();
                 item.Product = product;
                item.Quantity = quantity;
                var list = new List<CartItem>();
                list.Add(item);
                Session[Common.CommonConstants.CartSession] = list;
            }


            return RedirectToAction("Index");
        }

        public JsonResult Delete(long id)
        {
            var sessionCart = (List<CartItem>)Session[Common.CommonConstants.CartSession];
            sessionCart.RemoveAll(x => x.Product.ID == id);
            Session[Common.CommonConstants.CartSession] = sessionCart;
            return Json(new
            {
                status = true
            });
        }
        public JsonResult Update(string cartModel)
        {
            var jsonCart = new JavaScriptSerializer().Deserialize<List<CartItem>>(cartModel);
            var sessionCart = (List<CartItem>)Session[Common.CommonConstants.CartSession];

            foreach (var item in sessionCart)
            {
                var jsonItem = jsonCart.SingleOrDefault(x => x.Product.ID == item.Product.ID);
                if (jsonItem != null)
                {
                    item.Quantity = jsonItem.Quantity;
                }
            }
            Session[Common.CommonConstants.CartSession] = sessionCart;
            return Json(new
            {
                status = true
            });
        }

        [HttpGet]
        public ActionResult Payment()
        {
            var cart = Session[Common.CommonConstants.CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {

                list = (List<CartItem>)cart;
            }

            return View(list);
        }

        [HttpGet]
        public ActionResult Success()
        {
            long id=(long)TempData["ID"];
            ViewBag.Order = new OrderDao().Detail(id);
            var cart = Session[Common.CommonConstants.CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {

                list = (List<CartItem>)cart;
            }
            return View(list);
        }

        
        [HttpPost]
        public ActionResult Payment(string shipName,string phone,string address,string email,string note)
        {
            var order = new Order();
            order.CreatedDate = DateTime.Now;
            order.ShipName = shipName;
            order.ShipEmail = email;
            order.ShipMobile = phone;
            order.ShipAddress = address;
            order.Note = note;
            order.Status = 1;
            try
            {
                var cart = (List<CartItem>)Session[Common.CommonConstants.CartSession];
               
                if (cart==null ||cart.Count<1)
                {
                 
                    return Redirect("/hoan-thanh");
                }
                var id = new OrderDao().Insert(order);
                TempData["ID"] = id;
                var detailDao = new OrderDetailDao();
            
                foreach (var item in cart)
                {
                    var orderDetail = new OrderDetail();
                    orderDetail.ProductID = item.Product.ID;
                    orderDetail.OrderID = id;
                    if (item.Product.PromotionPrice == 0)
                    {
                        orderDetail.Price = item.Product.Price;
                    }
                    else
                    {
                        orderDetail.Price = item.Product.PromotionPrice;
                    }
                   
                    orderDetail.Quantity = item.Quantity;
                    detailDao.Insert(orderDetail);

                    var dao = new ProductDao();
                    item.Product.Quantity -= item.Quantity;
                    var product = item.Product;
                    dao.ChangeQuantity(product);

                }

            }
            catch (Exception ex)
            {
               
                throw;
            }
           
         
            return Redirect("/hoan-thanh");
        }


    }
}