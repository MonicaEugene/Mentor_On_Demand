using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace MentorMicroservice.Models
{
    public class MentorSkillDetails
    {
       public int MentorSkillId { get; set; }
       public int SkillId { get; set; }
       public string SkillName { get; set; }
       public int SkillDuration { get; set; }
       public string SToc { get; set; } 
	   public decimal MentorSkillRating { get; set; }
       public int MentorSkillRTrainingsDelivered { get; set; }
       public int MentorSkillYoe { get; set; } 
	   public string MentorSkillFacilities { get; set; }
    }
}
