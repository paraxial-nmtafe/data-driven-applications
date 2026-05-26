using MySql.Data.MySqlClient;

namespace student_example
{
    class Student : DatabaseTable
    {
        public UInt32 ID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public Dictionary<string, string> errors { get; set; }

        public Student()
        {
            FirstName = "";
            LastName = "";
        }

        public Student(string firstName, string lastName)
        {
            FirstName = firstName;
            LastName = lastName;
        }

        public bool Save()
        {
            try
            {
                // open the connection to database
                // write your insert statement (with prepared statements etc)
                this.connection.Open();
                string query = "";
                if (this.ID == 0) {
                   query = "insert into students (first_name, last_name) values ('@first_name', '@last_name');";
                    MySqlCommand command = new MySqlCommand(query, this.connection);
                        command.Parameters.AddWithValue("@first_name", this.FirstName);
                        command.Parameters.AddWithValue("@last_name", this.LastName);
                        command.Prepare();

                    command.ExecuteNonQuery();
                } else
                {
                    query = "update students set first_name = @first_name, last_name = @last_name where id = @id";
                    MySqlCommand command = new MySqlCommand(query, this.connection);
                        command.Parameters.AddWithValue("@first_name", this.FirstName);
                        command.Parameters.AddWithValue("@last_name", this.LastName);
                        command.Parameters.AddWithValue("@id", this.ID);
                        command.Prepare();
                    command.ExecuteNonQuery();
                }


                this.connection.Close();
                return true;
            }
            catch (Exception ex) {
                this.connection.Close();
                this.errors = new Dictionary<string, string>();
                this.errors.Add("Database Failure", ex.Message);
                return false;
            }
        }

        public bool IsValid()
        {
            Dictionary<string, string> errors = new Dictionary<string, string>();
            if (this.FirstName.Length < 1)
            {
                errors.Add("FirstName", "Should be at least one character");
            }
            if (this.LastName.Length < 1)
            {
                errors.Add("LastName", "Should be at least one character");
            }

            this.errors = errors;

            return this.errors.Count == 0;
        }
    }
}