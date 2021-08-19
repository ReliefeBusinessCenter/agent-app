

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace broker.Models
{
    public class Broker
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int BrokerId { get; set; }

        

        public int? CategoryId { get; set; }

        public int? SkillsId { get; set; }

 

public int? UserId { get; set; }
        public User User { get; set; }
        public Portfolio Portfolio { get; set; }

        public Skills Skills { get; set; }

        public Catigory Catigory { get; set; }
        public Delivery Delivery { get; set; }
        public Deals Deals { get; set; }

        public Buy Buy { get; set; }







    }

}