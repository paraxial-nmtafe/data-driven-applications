using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;

namespace student_example
{
    internal class DatabaseTable
    {
        protected MySqlConnection connection;
         public DatabaseTable ()
        {
            string connectionString = "host=localhost;port=3306;uid=app_user;pwd=Hunter2!;database=student_system;";
            connection = new MySqlConnection(connectionString);
        }
    }
}
