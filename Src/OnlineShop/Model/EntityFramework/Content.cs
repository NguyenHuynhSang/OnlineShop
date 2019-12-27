namespace Model.EntityFramework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Content")]
    public partial class Content
    {
        public long ID { get; set; }
        [StringLength(250, ErrorMessage = "Tên tin tức không vượt quá 250 ký tự"), MinLength(1, ErrorMessage = "Độ dài tối thiểu 1 ký tự")]
        [DisplayName("Tên tin tức")]
        [Required(ErrorMessage = "Tên tin tức không được để trống")]
        public string Name { get; set; }

        [StringLength(250)]
        public string MetaTitle { get; set; }

        [StringLength(500)]
        [DisplayName("Mô tả")]
        public string Description { get; set; }

        [StringLength(250)]
        [DisplayName("Hình ảnh")]
        public string Image { get; set; }
        [DisplayName("Nhóm tin tức")]
        public long? CategoryID { get; set; }

        [Column(TypeName = "ntext")]
        [DisplayName("ChiTiết")]
        public string Detail { get; set; }

        public int? Warranty { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(50)]
        public string ModifiedBy { get; set; }

        [StringLength(250)]
        public string MetaKeywords { get; set; }

        [StringLength(250)]
        public string MetaDescriptions { get; set; }

        public bool Status { get; set; }
        [DisplayName("Sản phẩm hot")]
        public DateTime? TopHot { get; set; }

        public int? ViewCount { get; set; }

        [StringLength(500)]
        [DisplayName("Tags")]
        public string Tags { get; set; }

        [StringLength(2)]
        [DisplayName("Ngôn ngữ")]
        public string Language { get; set; }
    }
}
