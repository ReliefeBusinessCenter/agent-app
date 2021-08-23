using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

using System.Collections.Generic;
using broker.Models;

namespace broker.Dto
{
    public class CategoryDto
    {



      [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int CatigoryId { get; set; }

        public string CatigoryName { get; set; }











    }
}