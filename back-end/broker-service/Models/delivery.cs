

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace broker.Models
{
    public class Delivery
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int DeliveryId { get; set; }
        public string DeliveryStatus { get; set; }
        public string Location { get; set; }

        // Navigational properties
        public int CustomerId { get; set; }
        public Customer Customer { get; set; }
        public int BrokerId { get; set; }
        public Broker Broker { get; set; }













    }

}