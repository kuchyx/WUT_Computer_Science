using System.ComponentModel.DataAnnotations;

namespace MvcMovie.Models
{
    public class User
    {

        public string? email { get; set; }
        public int ID { get; set; }
        
        public string? password { get; set; }
    }
}