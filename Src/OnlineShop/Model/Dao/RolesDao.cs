using Model.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{

    public class RolesDao
    {
        OnlineShopDbContext db = null;
        public RolesDao()
        {
            db = new OnlineShopDbContext();
        }

        public List<Role> GetListRoles()
        {
            var model = db.Roles.ToList();
         
            return model.ToList();
        }


    }
}
