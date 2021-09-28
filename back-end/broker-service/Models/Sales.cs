

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace broker.Models
{
    public class Sales
    {

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int SalesId { get; set; }

       
     
        public int Quantity { get; set; }
        public string Color { get; set; }
        public int ProductId { get; set; }
        // navigational propery
         public Broker Broker { get; set; }

        public Customer Customer { get; set; }

     




    }

}