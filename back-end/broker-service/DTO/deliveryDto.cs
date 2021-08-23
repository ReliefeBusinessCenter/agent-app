using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

using System.Collections.Generic;
using broker.Models;

namespace broker.Dto
{
    public class DeliveryDto
    {



    [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int DeliveryId { get; set; }
        public string DeliveryStatus { get; set; }
        public string Location { get; set; }

        // Navigational properties
        public int CustomerId { get; set; }
        public Customer Customer { get; set; }









    }
}