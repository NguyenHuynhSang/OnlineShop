﻿using Model.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
namespace OnlineShop.Controllers
{
    public class ContentController : Controller
    {
        // GET: Content
        public ActionResult Index(int page = 1, int pageSize = 10)
        {
            var model = new ContentDao().ListAllPaging(page, pageSize);
            int totalRecord = 0;

            ViewBag.Total = totalRecord;
            ViewBag.Page = page;
            ViewBag.category = new CategoriesDao().ListAll();
            ViewBag.recentpost = new ContentDao().ListRecentPost();
            ViewBag.tag = new ContentDao().ListAllTag();

            int maxPage = 5;
            int totalPage = 0;

            totalPage = (int)Math.Ceiling((double)(totalRecord / pageSize));
            ViewBag.TotalPage = totalPage;
            ViewBag.MaxPage = maxPage;
            ViewBag.First = 1;
            ViewBag.Last = totalPage;
            ViewBag.Next = page + 1;
            ViewBag.Prev = page - 1;

            return View(model);
        }

        public ActionResult Detail(long id)
        {
            var model = new ContentDao().GetByID(id);
            ViewBag.category = new CategoriesDao().ListAll();
            ViewBag.Tags = new ContentDao().ListTag(id);
            ViewBag.recentpost = new ContentDao().ListRecentPost();
            ViewBag.tag = new ContentDao().ListAllTag();
            return View(model);
        }
        public ActionResult Category(long id)
        {
            int page = 1; int pageSize = 10;
            var model = new ContentDao().ListAllByCategory(id);
            int totalRecord = 0;
            ViewBag.Total = totalRecord;
            ViewBag.Page = 1;
            ViewBag.category = new CategoriesDao().ListAll();
            ViewBag.recentpost = new ContentDao().ListRecentPost();
            ViewBag.tags = new ContentDao().ListAllTag();
            int maxPage = 5;
            int totalPage = 0;

            totalPage = (int)Math.Ceiling((double)(totalRecord / pageSize));
            ViewBag.TotalPage = totalPage;
            ViewBag.MaxPage = maxPage;
            ViewBag.First = 1;
            ViewBag.Last = totalPage;
            ViewBag.Next = page + 1;
            ViewBag.Prev = page - 1;

            return View(model);
        }
    }
}

      