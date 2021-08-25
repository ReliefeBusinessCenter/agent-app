// using System;
// using System.Collections.Generic;
// using System.IdentityModel.Tokens.Jwt;
// using System.Linq;
// using System.Security.Claims;
// using System.Text;
// using broker.Data;
// using broker.Entity;
// using broker.Models;
// using Microsoft.Extensions.Options;
// using Microsoft.IdentityModel.Tokens;
// namespace broker.service

// {
   

//     public class UserService : IUserService
//     {   
//          private  IRepository<User> _userRepository;
//          private  List<User> registeredUsers; 

//          public UserService(IRepository<User> repo)
//         {
//             _userRepository = repo;
          
//         }

//      private async void getUsers() {
//             List<User> users = await _jobRepository.GetData();
//             this.registeredUsers=users;
//        }

//         private readonly AppSettings _appSettings;

//         public UserService(IOptions<AppSettings> appSettings)
//         {
//             _appSettings = appSettings.Value;
//         }

//         public UserEntity Authenticate(string username, string password)
//         {
//             getUsers();
//             var user = this.registeredUsers.SingleOrDefault(x => x.Email == username && x.Password == password);

//             // return null if user not found
//             if (user == null)
//                 return null;

//             // authentication successful so generate jwt token
//             var tokenHandler = new JwtSecurityTokenHandler();
//             var key = Encoding.ASCII.GetBytes(_appSettings.Secret);
//             var tokenDescriptor = new SecurityTokenDescriptor
//             {
//                 Subject = new ClaimsIdentity(new Claim[]
//                 {
//                     new Claim(ClaimTypes.Name,user.UserId.ToString()),
//                     new Claim(ClaimTypes.Role, user.Role.RoleName)
//                 }),
//                 Expires = DateTime.UtcNow.AddDays(7),
//                 SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
//             };
//             var token = tokenHandler.CreateToken(tokenDescriptor);
//             // user.Token = tokenHandler.WriteToken(token);
//             UserEntity userEntity =new UserEntity();
//             userEntity.user=user;
//             userEntity.Token=tokenHandler.WriteToken(token);
//             return userEntity;
//         }

//         UserEntity IUserService.Authenticate(string username, string password)
//         {
//             throw new NotImplementedException();
//         }

//         //     public IEnumerable<UserEntity> GetAll()
//         // {
//         //     return _users;
//         // }

//         // public UserEntity GetById(int id)
//         // {
//         //     var user = _users.FirstOrDefault(x => x.UserId == id);
//         //     return user;
//         // }
//     }
// }