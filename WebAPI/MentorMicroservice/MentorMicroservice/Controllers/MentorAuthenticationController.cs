using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MentorMicroservice.Models;

namespace MentorMicroservice.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MentorAuthenticationController : ControllerBase
    {
        Mentor_on_DemandContext mod = new Mentor_on_DemandContext();
        // GET: api/MentorAuthentication
        [HttpGet]
        public IEnumerable<Mentor> Get()
        {
            return mod.Mentor.ToList();
        }

        // GET: api/MentorAuthentication/5
        [HttpGet]
        [Route("Authenticate")]
        public Mentor Get(string username,string password)
        {
            return mod.Mentor.ToList().Find(e => e.Username == username && e.MentorPassword == password);
            //return mod.Mentor.FromSql("authenticateMentor '"+username+"','"+password+"'").SingleOrDefault();
        }

        // POST: api/MentorAuthentication
        [HttpPost]
        public void Post([FromBody] Mentor newMentor)
        {
            mod.Database.ExecuteSqlCommand("registerNewMentor '" + newMentor.Username + "','" + newMentor.MentorPassword +
                "','" + newMentor.FirstName + "','" + newMentor.LastName + "'," + newMentor.ContactNumber + ",'" + newMentor.RegDatetime +
                "','" + newMentor.LinkedinUrl + "'," + newMentor.YearsOfExperience);
        }

        // PUT: api/MentorAuthentication/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] Mentor updatedMentor)
        {
            mod.Database.ExecuteSqlCommand("editMentorProfile '" + updatedMentor.Username + "','" + updatedMentor.MentorPassword +
                "','" + updatedMentor.FirstName + "','" + updatedMentor.LastName + "'," + updatedMentor.ContactNumber + ",'" +
                updatedMentor.LinkedinUrl + "'," + updatedMentor.YearsOfExperience);
        }
    }
}
