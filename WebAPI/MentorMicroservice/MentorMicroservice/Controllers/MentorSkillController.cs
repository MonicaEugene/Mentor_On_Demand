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
    public class MentorSkillController : ControllerBase
    {
        Mentor_on_DemandContext mod = new Mentor_on_DemandContext();
        // GET: api/MentorSkill
        [HttpGet]
        public IEnumerable<Skills> Get()
        {
            return mod.Skills.ToList();
        }

        // GET: api/MentorSkill/5
        [HttpGet]
        [Route("SkillsForMentor")]
        public IEnumerable<MentorSkillDetails> Get(int id)
        {
            return mod.MentorSkillDetails.FromSql("getSkillsForMentor "+id).ToList();
        }

        // POST: api/MentorSkill
        [HttpPost]
        public void Post([FromBody] MentorSkills value)
        {
            mod.Database.ExecuteSqlCommand("addSkillForMentor " + value.MId + "," + value.SId + "," + value.SelfRating +
                "," + value.YearsOfExp + "," + value.TrainingsDelivered + ",'" + value.FacilitiesOffered + "'");
        }

        // PUT: api/MentorSkill/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
