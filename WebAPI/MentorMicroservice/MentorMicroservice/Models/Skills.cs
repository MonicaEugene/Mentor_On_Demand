using System;
using System.Collections.Generic;

namespace MentorMicroservice.Models
{
    public partial class Skills
    {
        public Skills()
        {
            MentorSkills = new HashSet<MentorSkills>();
            Trainings = new HashSet<Trainings>();
        }

        public int Id { get; set; }
        public string SName { get; set; }
        public string SToc { get; set; }
        public int SDurationHrs { get; set; }
        public string Prerequisites { get; set; }

        public ICollection<MentorSkills> MentorSkills { get; set; }
        public ICollection<Trainings> Trainings { get; set; }
    }
}
