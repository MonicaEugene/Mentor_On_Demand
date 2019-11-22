using System;
using System.Collections.Generic;

namespace UserMicroservice.Models
{
    public partial class TblAdmin
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public string AdPassword { get; set; }
    }
}
