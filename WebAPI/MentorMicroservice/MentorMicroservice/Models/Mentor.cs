using System;
using System.Collections.Generic;

namespace MentorMicroservice.Models
{
    public partial class Mentor
    {
        public Mentor()
        {
            MentorSkills = new HashSet<MentorSkills>();
            Trainings = new HashSet<Trainings>();
        }

        public int Id { get; set; }
        public string Username { get; set; }
        public string MentorPassword { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public long ContactNumber { get; set; }
        public DateTime? RegDatetime { get; set; }
        public string RegCode { get; set; }
        public bool? ForceResetPassword { get; set; }
        public string LinkedinUrl { get; set; }
        public int YearsOfExperience { get; set; }

        public ICollection<MentorSkills> MentorSkills { get; set; }
        public ICollection<Trainings> Trainings { get; set; }
    }
}
