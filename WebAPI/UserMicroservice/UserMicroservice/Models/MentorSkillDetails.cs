using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace UserMicroservice.Models
{
    public class MentorSkillDetails
    {
        public int MentorId { get; set; }
        public string MentorEmail { get; set; }
        public long MentorPhone { get; set; }
        public string MentorFirstName { get; set; }
        public string MentorLastName { get; set; }
		public string MentorLinkedInURL { get; set; }
        public int MentorYOE { get; set; }
		public decimal MentorSkillRating { get; set; }
        public int MentorSkillTrainingsDelivered { get; set; }
        public int MentorSkillYOE { get; set; }
		public string MentorSkillFacilitiesOffered { get; set; }
		public string MentorSkillName { get; set; }
        public int MentorSkillId { get; set; }
    }
}
