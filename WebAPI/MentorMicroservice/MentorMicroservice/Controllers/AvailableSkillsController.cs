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
    public class AvailableSkillsController : ControllerBase
    {
        Mentor_on_DemandContext mod = new Mentor_on_DemandContext();

        // GET: api/AvailableSkills/5
        [HttpGet("{id}", Name = "Get")]
        public IEnumerable<Skills> Get(int id)
        {
            return mod.Skills.FromSql("getAvailableMentorSkills "+id);
        }
        
    }
}
