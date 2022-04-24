using Microsoft.AspNetCore.Mvc;
using System.Text.Encodings.Web;

namespace MvcMovie.Controllers
{
    public class RegisterController : Controller
    {
        // 
        // GET: /HelloWorld/

    public IActionResult Index()
    {
        return View();
    }


        // 
        // GET: /HelloWorld/Welcome/ 

        public string Welcome(string name, int numTimes = 19)
        {
            return HtmlEncoder.Default.Encode($"Hello {name}, NumTimes is: {numTimes}");
        }
    }
}