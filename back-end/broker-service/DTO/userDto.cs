using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

using System.Collections.Generic;
using broker.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;

namespace broker.Dto
{
    public class UserDto
    {



       [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int UserId { get; set; }

        public string FullName { get; set; }

        public string Email { get; set; }

        public string Password { get; set; }

        public string Phone { get; set; }

        public string Address { get; set; }
 [FromForm]
        public IFormFile Picture { get; set; }
        // public string Picture { get; set; }

        public string Sex { get; set; }
        
        public string Role { get; set; }











    }
}