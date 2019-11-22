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
    public class MentorFunctionsController : ControllerBase
    {
        Mentor_on_DemandContext mod = new Mentor_on_DemandContext();

        [HttpGet]
        public IEnumerable<Trainings> Get()
        {
            return mod.Trainings.ToList();
        }
        // GET: api/MentorFunctions/5
        [HttpGet("{id}")]
        public IEnumerable<TrainingsForMentor> Get(int id)
        {
            return mod.TrainingsForMentors.FromSql("getAllTrainingsForMentor "+id).ToList();
        }
        

        // PUT: api/MentorFunctions/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] Trainings value)
        {
            mod.Database.ExecuteSqlCommand("updateTrainingStatus " + value.Id + ",'" + value.Status + "'");
        }
    }
}
