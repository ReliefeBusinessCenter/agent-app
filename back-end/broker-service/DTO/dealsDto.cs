using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

using System.Collections.Generic;
using broker.Models;

namespace broker.Dto
{
    public class DealsDto
    {



      [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int DealsId { get; set; }
        public int Quantity { get; set; }
        public string Location { get; set; }
        public string Color { get; set; }
        public string PaymentOption { get; set; }
        public string DealsStatus { get; set; }











    }
}