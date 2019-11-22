using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace MentorMicroservice.Models
{
    public class TrainingsForMentor
    {
        public int TrainingId { get; set; }
        public int SkillId { get; set; }
        public string SkillName { get; set; }
        public int Duration { get; set; }
        public string UserFirstName { get; set; }
        public string UserLastName { get; set; }
        public long UserContactNumber { get; set; }
        public string UserEmail { get; set; }
        public string TrainingStatus { get; set; }
    }
}
