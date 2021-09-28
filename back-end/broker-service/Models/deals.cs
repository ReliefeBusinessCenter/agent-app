

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace broker.Models
{
    public class Deals
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int DealsId { get; set; }
        public int Quantity { get; set; }
        public string Location { get; set; }
        public string Color { get; set; }
        public string PaymentOption { get; set; }
        public string DealsStatus { get; set; }
        // navigational property
     public Broker Broker { get; set; }

        public Customer Customer { get; set; }



     
       






    }

}