

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace broker.Models
{
    public class Buy
    {

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int BuyId { get; set; }

        public int Quantity { get; set; }
        public string Color { get; set; }
        public int ProductId { get; set; }
        // navigational proprty
         public Broker Broker { get; set; }

        public Customer Customer { get; set; }
        




    }

}