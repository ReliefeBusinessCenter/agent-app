

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace broker.Models
{
    public class Customer
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int CustomerId { get; set; }

        public int UserId { get; set; }

        public int ReviewId { get; set; }

        public int DealsId { get; set; }

        public int DeliveryId { get; set; }

        public User User { get; set; }

        public Review Review { get; set; }
        public Deals Deals { get; set; }

        public Delivery Delivery { get; set; }

       





    }

}