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
    public class UserAuthenticationController : ControllerBase
    {
        Mentor_on_DemandContext mod = new Mentor_on_DemandContext();
        // GET: api/UserAuthentication
        [HttpGet]
        public IEnumerable<UserDtls> Get()
        {
            return mod.UserDtls.ToList();
        }

        // GET: api/UserAuthentication/5
        [HttpGet]
        [Route("Authenticate")]
        public UserDtls Get(string username, string password)
        {
            return mod.UserDtls.FromSql("authenticateUser '" + username + "','" + password + "'").SingleOrDefault();
        }

        // POST: api/UserAuthentication
        [HttpPost]
        public void Post([FromBody] UserDtls newUser)
        {
            try
            {
                mod.Database.ExecuteSqlCommand("registerNewUser '" + newUser.Username + "','" + newUser.UserPassword + "','" + newUser.FirstName + "','" + newUser.LastName + "'," + newUser.ContactNumber + ",'" + newUser.RegDatetime + "'");
            }
            catch(Exception e)
            {

            }
        }

    }
}
