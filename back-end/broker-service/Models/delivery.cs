

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace broker.Models
{
    public class Delivery
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int DeliveryId { get; set; }
        public string DeliveryStatus { get; set; }
        public string Location { get; set; }

        // navigational property
        public int BrokerId { get; set; }
        [JsonIgnore]
        public Broker Broker { get; set; }
        public int CustomerId { get; set; }
        // [JsonIgnore]
        public Customer Customer { get; set; }
        

    }













}

