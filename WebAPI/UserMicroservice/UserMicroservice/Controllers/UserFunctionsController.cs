using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using UserMicroservice.Models;

namespace UserMicroservice.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserFunctionsController : ControllerBase
    {
        Mentor_on_DemandContext mod = new Mentor_on_DemandContext();
        // GET: api/UserFunctions
        [HttpGet]
        public IEnumerable<MentorSkillDetails> Get()
        {
            return mod.MentorSkillDetails.FromSql("getAllMentorsDetails").ToList();
        }

        // GET: api/UserFunctions/5
        [HttpGet("{id}", Name = "Get")]
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/UserFunctions
        [HttpPost]
        public void Post([FromBody] Trainings value)
        {
            mod.Database.ExecuteSqlCommand("setTraining " + value.Userid + "," + value.MentorId + "," + value.SkillId);
        }

        // PUT: api/UserFunctions/5
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
