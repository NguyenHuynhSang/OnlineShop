﻿using Model.Dao;
using Model.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class ProductController : BaseController
    {
        // GET: Admin/Product

        public ActionResult Index(string name = "", string masp ="",bool? status=null,int? CategoryID=null,string rank="")

        {
            SetViewBagAllCategory();
            int? minQ = 0;
            int? maxQ = 1000;

            if (!String.IsNullOrEmpty(rank))
            {
                var items = rank.Split(';');
                minQ = Convert.ToInt32(items[0]);
                maxQ = Convert.ToInt32(items[1]);
                var quantity = new int[2];
                quantity[0] = minQ.Value;
                quantity[1] = maxQ.Value;


            }
            ViewBag.minQ = minQ.Value;
            ViewBag.maxQ = maxQ.Value;
            ViewBag.Name = name;
            ViewBag.Masp = masp;

            var dao = new ProductDao();
            var listProduct = dao.GetListProduct(name, masp, status, CategoryID, minQ, maxQ);

            SetAlert("Load thành công", "success");
            return View(listProduct);
        }


        [HttpGet]
        public ActionResult Create()
        {
            var product = new Product();
            product.Price = 0;
            product.PromotionPrice = 0;
            product.Quantity = 0;
            product.IsHot = false;
            product.IncludedVAT = true;
            product.OrginalPrice = 0;
            ViewBagCategory();
            return View(product);
        }



        [HttpPost, ValidateInput(false)]
        public ActionResult Create(Product product)
        {
            var dao = new ProductDao();

            var listProduct = dao.GetListProduct();
            ViewBagCategory();
            if (ModelState.IsValid)
            {
                product.MetaTitle = product.MetaTitle.Replace('/', '-');
                product.MetaTitle = product.MetaTitle.Replace('.', '-');
                product.MetaTitle = product.MetaTitle.Replace(',', '-');
                product.MetaTitle = product.MetaTitle.Replace('\'', '-');
                product.MetaTitle = product.MetaTitle.Replace('(', '-');
                product.MetaTitle = product.MetaTitle.Replace(')', '-');
                product.MetaTitle = product.MetaTitle.Replace('+', '-');
                product.MetaTitle = product.MetaTitle.Replace('?', '-');
                product.MetaTitle += listProduct.Count();
                product.Status = true;

                long id = dao.Insert(product);
                if (id > 0)
                {

                    // chuyển hướng trang về admin/product/index
                    var result = dao.GetListProduct();
                    return RedirectToAction("Index", "Product", result);
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
            ViewBagCategory();
            var product = new ProductDao().ViewDetail(id);
            product.IncludedVAT = true;
            return View(product);
        }


        [HttpPost, ValidateInput(false)]

        public ActionResult Edit(Product product)
        {
            ViewBagCategory();
            var dao = new ProductDao();
            var model = dao.GetListProduct();
            if (ModelState.IsValid)
            {

                var result = dao.Update(product);

                if (result)
                {
                    return RedirectToAction("Index", "Product", model);
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật không thành công");
                    SetAlert("Cập nhật không thành công", "error");
                }
            }
            return View("Edit");
        }




        void ViewBagCategory()
        {

            var dao = new ProductCategoryDao();
            SelectList a = new SelectList(dao.ListChildCaterogys(), "ID", "Name", null);
            ViewBag.CategoryID = new SelectList(dao.ListChildCaterogys(), "ID", "Name", null);

        }

        void SetViewBagAllCategory()
        {
            var dao = new ProductCategoryDao();
            ViewBag.AllCategory = dao.ListAll();
            ViewBag.Status = new SelectList(new[]
           {
                                    new { ID="true", Status="Hiển thị" },
                                    new { ID="false", Status="Ẩn" },
                                }, "ID", "Status", true);



        }

    }
}