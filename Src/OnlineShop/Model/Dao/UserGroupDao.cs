﻿using Model.EntityFramework;
using Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class UserGroupDao
    {
        OnlineShopDbContext db = null;
        public UserGroupDao()
        {
            db = new OnlineShopDbContext();
        }

        public bool Insert(UserGroup entity)
        {
            db.UserGroups.Add(entity);
            db.SaveChanges();
            return true;
        }

        public  List<UserGroup> GetUserGroups()
        {
            return db.UserGroups.ToList();
        }


        public UserGroup ViewDetail(string ID)
        {
            return db.UserGroups.Find(ID);
        }

        public List<UserRoleByGroupModel> GetRoleByGroup()
        {

            List<Credential> credentials = db.Credentials.ToList();
            List<UserGroup> groups = db.UserGroups.ToList();
            List<Role> role = db.Roles.ToList();


            var userViewModel = from r in role
                                join c in credentials
                                on r.ID equals c.RoleID
                                join g in groups
                                on c.UserGroupID equals g.ID

                                select new UserRoleByGroupModel
                                {
                                    userGroup = g,
                                    role=r,
                                };


            return userViewModel.ToList();
        }


        public void Delete(string id)
        {
            var credentials = db.Credentials.Where(x => x.UserGroupID == id);
            db.Credentials.RemoveRange(credentials);
            db.SaveChanges();
        }


        public bool InsertCredentials(Credential entity)
        {
            db.Credentials.Add(entity);
            db.SaveChanges();
            return true;
        }

    }
}
