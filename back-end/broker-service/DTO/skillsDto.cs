using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

using System.Collections.Generic;
using broker.Models;

namespace broker.Dto
{
    public class SkillsDto
    {



      [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int SkillsId { get; set; }
        public double CommunicationSkill { get; set; }
        public double BrokingSkill { get; set; }
        public double WorkDone { get; set; }
        public double WorkInProgress { get; set; }










    }
}