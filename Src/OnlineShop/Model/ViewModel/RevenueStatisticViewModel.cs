using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{
   public class RevenueStatisticViewModelDateType
    {
        public DateTime Date { set; get; }
        public decimal Revenunes { set; get; }
        public decimal Benefis { set; get; }
    }


    public class RevenueStatisticViewModel
    {
        public String Date { set; get; }
        public decimal Revenunes { set; get; }
        public decimal Benefis { set; get; }
    }

}
