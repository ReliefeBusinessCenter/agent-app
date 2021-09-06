

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace broker.Models
{
    public class Skills
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int SkillsId { get; set; }
            // public Broker Broker { get; set; }
        public double CommunicationSkill { get; set; }
        public double BrokingSkill { get; set; }
        public double WorkDone { get; set; }
        public double WorkInProgress { get; set; }
       



    }

}