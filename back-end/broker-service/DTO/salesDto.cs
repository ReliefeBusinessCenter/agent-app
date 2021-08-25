using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

using System.Collections.Generic;
using broker.Models;

namespace broker.Dto
{
    public class SalesDto
    {



      [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int SalesId { get; set; }

       
     
        public int Quantity { get; set; }
        public string Color { get; set; }
        public int ProductId { get; set; }











    }
}