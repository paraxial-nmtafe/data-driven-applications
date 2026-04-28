/*
This is a terrible example of why you would use SQL to solve question 2 instead
of dong all the queries inside C#.  This is unnecessary complication that results
in doing a lot of queries that you don't really need.

Tl;dr: This could have been the following single query:
SELECT title, 
DESCRIPTION,
GROUP_CONCAT(concat(first_name, " ", last_name) ORDER BY last_name ASC SEPARATOR ";") AS actor_names 
FROM films
JOIN film_actor ON films.id = film_actor.film_id
JOIN actors ON actors.id = film_actor.actor_id
GROUP BY films.id;
*/



using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using Google.Protobuf.WellKnownTypes;
using MySql.Data.MySqlClient;

namespace Filmomatic9000
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private MySqlConnection connection;
        private string server = "127.0.0.1";
        private string port = "3306";
        private string username = "root";
        private string password = "";
        private string database = "sakila_tafe";

        public MainWindow()
        {
            InitializeComponent();
            string connectionString = $"server={server};port={port};uid={username};pwd={password};database={database};";
            connection = new MySqlConnection(connectionString);
        }

        /* 
            All of this is just to get the actor information
            which will be later married up in the main Event Handler
        */
        private List<string[]> GetActors()
        {
            List<string[]> actorInfo = new List<string[]>();
            try
            {
                connection.Open();

                string actor_query = "select films.id, concat(first_name, ' ', last_name) " +
                    "from films " +
                    "JOIN film_actor ON films.id = film_actor.film_id " +
                    "JOIN actors ON actors.id = film_actor.actor_id order by last_name;";
                MySqlCommand actorCommand = new MySqlCommand(actor_query, connection);
                MySqlDataReader actorReader = actorCommand.ExecuteReader();

                while (actorReader.Read())
                {
                    actorInfo.Add([actorReader[0].ToString(), (string)actorReader[1]]);
                }
                return actorInfo;
            } catch (Exception ex) {
                MessageBox.Show(ex.Message, "this is in GetActors");
            } finally {
                connection.Close();
            }

            return actorInfo;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            List<string[]> actorInfo = GetActors();
            try
            {
                FilmList.Items.Clear();

                connection.Open();
                string query = "select id, title, description " +
                    "from films " +
                    $"where description like '%{UserQuery.Text}%';";

                MySqlCommand command = new MySqlCommand(query, connection);
                MySqlDataReader reader = command.ExecuteReader();


                while (reader.Read())
                {
                    string id = reader.GetUInt16("id").ToString();
                    List<string> actors = new List<string>();
                    for (int i = 0; i < actorInfo.Count; i++) {
                        if (actorInfo[i][0] == id)
                        {
                            actors.Add(actorInfo[i][1]);
                        }
                    }
                    FilmList.Items.Add($"Title: {reader.GetString("title")}, Description: {reader.GetString("description")}, Actors: {string.Join(';', actors)}");
                }
            } 
            catch (Exception ex)
            {
                MessageBox.Show(ex.StackTrace, ex.Message);
            } 
            finally
            {
                connection.Close();
            }
            
        }
    }
}