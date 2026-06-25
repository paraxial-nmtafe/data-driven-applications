using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Windows;
using MySql.Data.MySqlClient;

namespace example
{
    class DataLayer
    {
        private MySqlConnection connection; 
        public DataLayer ()
        {
            /*
             * I made an empty user in my database like this:
                DROP USER if exists film_user@localhost;
                CREATE USER film_user@localhost IDENTIFIED BY "";
                GRANT USAGE, SELECT ON sakila_tafe.* TO film_user@localhost;
             */
            string connectionString = "host=localhost;port=3306;uid='film_user';database=sakila_tafe";
            connection = new MySqlConnection(connectionString);
        }
        public List<Film> GetFilms()
        {
            List<Film> films = new List<Film>();
            try
            {
                connection.Open();
                string query = "select * from films;";
                MySqlCommand command = new MySqlCommand(query, connection);
                MySqlDataReader reader = command.ExecuteReader();
                while (reader.Read()) {
                    Film film = new Film();
                    film.ID = reader.GetInt32("id");
                    film.Duration = reader.GetInt32("length"); // change of name between sql and C# just to show you that it can happen (don't do this)
                    film.Title = reader.GetString("title");
                    film.Description = reader.GetString("description");
                    film.Year = reader.GetInt32("release_year");
                    films.Add(film);
                }
            }
            catch (Exception ex)
            {
                // This is kind of a proxy for writing urgent and FATAL logs to the system because your database being down is honestly a huge deal.
                MessageBox.Show(ex.Message); // There shouldn't be UI components down here in the datalayer but it's an easy way to debug.
                Console.WriteLine(ex.Message); 
            }
            finally
            {
                connection.Close();
            }
            return films;
        }

        /// <summary>
        ///   Inserts a film to the database.
        ///   You should refresh your database data after running this so that everything is clean on the application layer.
        /// </summary>
        /// <param name="film">An unpersisted film to create for the first time, contrast "UpdateFilm"</param>
        /// <returns>boolean indicating success.</returns>
        public bool SaveFilm(Film film)
        {
            try
            {
                connection.Open();
                string query = "insert into films (title, description, length, release_year) values (@title, @description, @length, @year);";
                MySqlCommand command = new MySqlCommand(query, connection);
                command.Parameters.AddWithValue("@title", film.Title);
                command.Parameters.AddWithValue("@description", film.Description);
                command.Parameters.AddWithValue("@length", film.Duration);
                command.Parameters.AddWithValue("@year", film.Year);

                command.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                connection.Close(); // C# is weird -- afaik `finally` *will* execute after return.  Useful though.
            }

            return false; // This only fires if the insert failed in some way, hopefully documented by by the log in the catch.
        }

        public bool UpdateFilm(Film film)
        {
            // Not yet implemented
            return false;
        }
    }
}
