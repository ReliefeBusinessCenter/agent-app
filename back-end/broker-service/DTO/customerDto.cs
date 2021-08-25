using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

using System.Collections.Generic;
using broker.Models;

namespace broker.Dto
{
    public class CustomerDto
    {



        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int CustomerId { get; set; }
        public ICollection<Review> Reviews { get; set; }

        public ICollection<Deals> Deals { get; set; }
        public ICollection<Delivery> Delivery { get; set; }
        public ICollection<Sales> Sales { get; set; }

        // Navigational properties

        public User User { get; set; }















    }
}