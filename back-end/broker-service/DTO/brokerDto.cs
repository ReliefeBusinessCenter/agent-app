using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

using System.Collections.Generic;
using broker.Models;

namespace broker.Dto
{
    public class BrokerDto
    {



        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
      
        public int BrokerId { get; set; }
        public ICollection<Portfolio> Portfolios { get; set; }
        public ICollection<Delivery> Deliveries { get; set; }
        public ICollection<Deals> Deals { get; set; }
        public ICollection<Buy> Buys { get; set; }
        public ICollection<Review> Reviews { get; set; }
         public Skills Skills { get; set; }

        // navigational properties
        public int? UserId { get; set; }
        public User User { get; set; }
        public int? CategoryId { get; set; }
        public Catigory Catigory { get; set; }












    }
}