using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

using System.Collections.Generic;
using broker.Models;

namespace broker.Dto
{
    public class PortfolioDto
    {



     [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int PortfolioId { get; set; }
         public string Image { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }









    }
}