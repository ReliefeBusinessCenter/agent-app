

using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace broker.Models
{
    public class Broker
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int BrokerId { get; set; }
        public ICollection<Portfolio> Portfolios { get; set; }
        public ICollection<Delivery> Deliveries { get; set; }
        public ICollection<Deals> Deals { get; set; }
        public ICollection<Review> Reviews { get; set; }
        public ICollection<Sales> Sales { get; set; }

        public Skills Skills { get; set; }
        public Category Category { get; set; }

        // navigational properties
        
        public User User { get; set; }
   }
}


