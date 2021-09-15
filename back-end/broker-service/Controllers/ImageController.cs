using System;
using System.Threading.Tasks;
using ImageUploader.Handler;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ImageUploader.Controllers
{
    [Route("api/image")]
    public class ImagesController : Controller
    {
        private readonly IImageHandler _imageHandler;

        public ImagesController(IImageHandler imageHandler)
        {
            _imageHandler = imageHandler;
        }

        /// <summary>
        /// Uplaods an image to the server.
        /// </summary>
        /// <param name="file"></param>
        /// <returns></returns>
        public async Task<IActionResult> UploadImage(IFormFile file)
        {   
            Console.WriteLine("Entered to the image upload");
            return await _imageHandler.UploadImage(file);
        }
    }
}