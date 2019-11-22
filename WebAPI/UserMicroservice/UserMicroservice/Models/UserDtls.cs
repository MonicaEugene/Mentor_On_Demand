using System;
using System.Collections.Generic;

namespace UserMicroservice.Models
{
    public partial class UserDtls
    {
        public UserDtls()
        {
            Trainings = new HashSet<Trainings>();
        }

        public int Id { get; set; }
        public string Username { get; set; }
        public string UserPassword { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public long ContactNumber { get; set; }
        public DateTime? RegDatetime { get; set; }
        public string RegCode { get; set; }
        public bool? ForceResetPassword { get; set; }

        public ICollection<Trainings> Trainings { get; set; }
    }
}
