using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EntityFramework;
using Model.ViewModel;

namespace Model.Dao
{
    public class OrderDao
    {
        OnlineShopDbContext db = null;
        public OrderDao()
        {
            db = new OnlineShopDbContext();
        }

        public Order Detail(long id)
        {
            return db.Orders.Find(id);
        }

        public long Insert(Order order)
        {
            db.Orders.Add(order);
            db.SaveChanges();
            return order.ID;
        }


        public List<RevenueStatisticViewModel> GetRevenueStatistic(string fromDate,string toDate)
        {

            var parameter = new object[]{
                new SqlParameter("@fromDate",fromDate),
                   new SqlParameter("@toDate",toDate),
            };

            var list = db.Database.SqlQuery<RevenueStatisticViewModelDateType>("GetRevenueStatistic @fromDate,@toDate", parameter).ToList();

            List<RevenueStatisticViewModel> listReturn=new List<RevenueStatisticViewModel>();

            foreach (var item in list)
            {
                RevenueStatisticViewModel val = new RevenueStatisticViewModel();
                val.Benefis = item.Benefis;
                val.Revenunes = item.Revenunes;
                val.Date = item.Date.ToString("dd/MMM/yyyy");

                listReturn.Add(val);
            }



            return listReturn;

    
    }

        public void ChangeStatus(Order order)
        {
            var entity = db.Orders.Find(order.ID);
            entity.Status = order.Status;
            db.SaveChanges();
        }
        public List<InvoiceViewModel> GetListInvoice(int? mahd = null, string tenkh = "", string sdt = "", string email = "", string createDate = "", int? status = null,string fromDate="",string toDate="")
         {

            List<Order> order = db.Orders.ToList();
            List<OrderDetail> orderDetail = db.OrderDetails.ToList();
            List<Product> products = db.Products.ToList();
            var userViewModel = from o in order
                                select new InvoiceViewModel
                                {
                                    order = o,
                                    orderDetails = (
                                    from d in orderDetail.Where(x => x.OrderID == o.ID)
                                    join p in products
                                    on d.ProductID equals p.ID
                                    select new OrderDetailViewModel
                                    {
                                        orderDetail = d,
                                        product = p,
                                    }
                                    ).ToList(),
                                };

            if(!String.IsNullOrEmpty(tenkh))
            {
                userViewModel = userViewModel.Where(x => x.order.ShipName.Contains(tenkh));
            }

            if (!String.IsNullOrEmpty(sdt))
            {
                userViewModel = userViewModel.Where(x => x.order.ShipMobile.Contains(sdt));
            }
            if (!String.IsNullOrEmpty(email))
            {
                userViewModel = userViewModel.Where(x => x.order.ShipMobile.Contains(email));
            }
            if (mahd != null) 
            {
                userViewModel = userViewModel.Where(x => x.order.ID==mahd);

            }

            if (status != null)
            {
                userViewModel = userViewModel.Where(x => x.order.Status == status);

            }

            if(!String.IsNullOrEmpty(fromDate) && !String.IsNullOrEmpty(toDate))
            {
                userViewModel = userViewModel.Where(x => x.order.CreatedDate >= Convert.ToDateTime(fromDate) && x.order.CreatedDate <= Convert.ToDateTime(toDate)); ;
            }

            return userViewModel.OrderByDescending(x=>x.order.CreatedDate).ToList();
        }


        public InvoiceViewModel ViewDetail(long ID)
        {

            List<Order> order = db.Orders.ToList();
            List<OrderDetail> orderDetail = db.OrderDetails.ToList();
            List<Product> products = db.Products.ToList();
            var userViewModel = from o in order
                                select new InvoiceViewModel
                                {
                                    order = o,
                                    orderDetails = (
                                    from d in orderDetail.Where(x => x.OrderID == o.ID)
                                    join p in products
                                    on d.ProductID equals p.ID
                                    select new OrderDetailViewModel
                                    {
                                        orderDetail = d,
                                        product = p,
                                    }
                                    ).ToList(),
                                };

            return userViewModel.FirstOrDefault(x=>x.order.ID==ID);

        }
    }
}
