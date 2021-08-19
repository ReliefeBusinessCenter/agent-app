

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace broker.Models
{
    public class Review
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ReviewId { get; set; }

        public int CustomerId { get; set; }

        public int BrokerId { get; set; }


       public int  rate { get; set; }

       public Customer Customer { get; set; }
       public Broker Broker { get; set; }
       

    






    }

}