using System;
using System.Collections.Generic;

namespace MentorMicroservice.Models
{
    public partial class Trainings
    {
        public int Id { get; set; }
        public int? Userid { get; set; }
        public int? MentorId { get; set; }
        public int? SkillId { get; set; }
        public string Status { get; set; }

        public Mentor Mentor { get; set; }
        public Skills Skill { get; set; }
        public UserDtls User { get; set; }
    }
}
