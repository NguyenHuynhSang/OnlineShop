using Model.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{
    public class RoleSelectViewModel
    {
        public List<string> roleId { set; get; }
       
        public UserGroup group { set; get; }


    }
}
