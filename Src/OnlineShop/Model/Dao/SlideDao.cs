using Model.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class SlideDao
    {
        OnlineShopDbContext db = null;
        public SlideDao()
        {
            db = new OnlineShopDbContext();
        }

        public List<Slide> ListAll()
        {
            return db.Slides.Where(x => x.Status == true).OrderBy(y => y.DisplayOrder).ToList();
        }


        public List<Slide> ListAllForAdmin(string discrip="",bool? status=null)
        {
            var model= db.Slides.OrderBy(y => y.CreatedDate).ToList();
            if(!String.IsNullOrEmpty(discrip))
            {
                model = model.Where(x => x.Description.Contains(discrip)).ToList();
            }
            if(status!=null)
            {
                model = model.Where(x=>x.Status==status).ToList();
            }
            return model;
        }

        public bool ChangeStatus(long id)
        {
            var user = db.Slides.Find(id);
            user.Status = !user.Status;
            db.SaveChanges();
            return user.Status.Value;
        }

        public long Insert(Slide entity)
        {
            entity.CreatedDate = DateTime.Now;
            db.Slides.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }


        public Slide ViewDetail(long id)
        {
            return db.Slides.Find(id);
        }



        public bool Update(Slide entity)
        {
            try
            {
               
                var slide = db.Slides.Find(entity.ID);

                slide.Description = entity.Description;
                slide.Image = entity.Image;
                slide.Link = entity.Link;
                slide.ModifiedDate = DateTime.Now;

    
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                //logging
                return false;
            }
        }

    }
}
