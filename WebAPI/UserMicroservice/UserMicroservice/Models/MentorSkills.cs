using System;
using System.Collections.Generic;

namespace UserMicroservice.Models
{
    public partial class MentorSkills
    {
        public int Id { get; set; }
        public int? MId { get; set; }
        public int? SId { get; set; }
        public decimal? SelfRating { get; set; }
        public int? YearsOfExp { get; set; }
        public int? TrainingsDelivered { get; set; }
        public string FacilitiesOffered { get; set; }

        public Mentor M { get; set; }
        public Skills S { get; set; }
    }
}
