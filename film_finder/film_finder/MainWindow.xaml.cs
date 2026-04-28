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
using MySql.Data.MySqlClient;

namespace film_finder
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private MySqlConnection connection;
        private string dbName = "sakila_tafe";
        private string dbUser = "root";
        private string dbPassword = "";
        private string server = "127.0.0.1";
        private string port = "3306";

        public MainWindow()
        {
            InitializeComponent();
            string connectionString = $"server={server};port={port};uid={dbUser};pwd={dbPassword};database={dbName}";
            connection = new MySqlConnection(connectionString);
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                ResultList.Items.Clear();
                connection.Open();
                string userQuery = FilmInput.Text;
                MySqlCommand command = new MySqlCommand($"select title, description from films where description like '%{userQuery}%';", connection);
                MySqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    ResultList.Items.Add($"Title: {reader[0]}, Description: {reader[1]}");
                }
            } 
            catch (Exception ex) {
                MessageBox.Show(ex.StackTrace, ex.Message);
            } 
            finally
            {
                connection.Close(); 
            }

        }
    }
}