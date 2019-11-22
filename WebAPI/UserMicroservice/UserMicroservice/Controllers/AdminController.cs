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
    public class AdminController : ControllerBase
    {
        Mentor_on_DemandContext mod = new Mentor_on_DemandContext();
        // GET: api/Admin
        [HttpGet]
        public IEnumerable<Skills> Get()
        {
            return mod.Skills.ToList();
        }

        // GET: api/Admin/5
        [HttpGet]
        [Route("Authenticate")]
        public TblAdmin Get(string username, string password)
        {
            return mod.TblAdmin.FromSql("authenticateAdmin '"+username+"','"+password+"'").SingleOrDefault();
        }

        // POST: api/Admin
        [HttpPost]
        public void Post([FromBody] Skills value)
        {
            mod.Database.ExecuteSqlCommand("addNewSkill '" + value.SName + "','" + value.SToc + "'," + value.SDurationHrs + ",'" + value.Prerequisites + "'");
        }

        // PUT: api/Admin/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] Skills value)
        {
            mod.Database.ExecuteSqlCommand("editSkill '" + value.SToc + "'," + value.SDurationHrs + ",'" + value.Prerequisites + "'," + value.Id);
        }
    }
}
