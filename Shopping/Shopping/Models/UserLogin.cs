using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Shopping.Models
{
    public class UserLogin
    {
        public int UserID { set; get; }
        public string UserName { set; get; }
        public int Role_ID { set; get; }
    }
}