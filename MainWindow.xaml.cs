using System.Data;
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
using MySqlConnector;

namespace Computer
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        public const string connectionString = "Server=localhost;User ID=root;Password=;Database=computer";

        private void systemsButton_Click(object sender, RoutedEventArgs e)
        {
            myListBox.Items.Clear();
            try
            {
                using (var connection = new MySqlConnection(connectionString))
                {
                    connection.Open();

                    var query = "SELECT * FROM osystem";
                    using (var cmd = new MySqlCommand(query, connection))
                    {
                        using (var reader = cmd.ExecuteReader())
                        { 
                            while (reader.Read())
                            {
                                myListBox.Items.Add("ID: " + reader.GetInt32(0) + " Name: " + reader.GetString(1));
                            }
                        }
                    }
                }
            }
            catch (Exception error)
            {
                MessageBox.Show(Convert.ToString(error));
                throw;
            }
        }

        private void computersButton_Click(object sender, RoutedEventArgs e)
        {
            myListBox.Items.Clear();
            try
            {
                using (var connection = new MySqlConnection(connectionString))
                {
                    connection.Open();

                    var query = "SELECT * FROM comp join osystem on comp.osId = osystem.id;";
                    using (var cmd = new MySqlCommand(query, connection))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                string createdTime = reader.IsDBNull(5) == false ? Convert.ToString(reader.GetDateTime(5)) : "0000-00-00 00:00:00";

                                myListBox.Items.Add("ID: " + reader.GetInt32(0) + " Brand: " + reader.GetString(1) + " Type: " + reader.GetString(2) + " Display: " + reader.GetDouble(3) + " Memory: " + reader.GetInt32(4) + " CreatedTime: " + createdTime + " OSID: " + reader.GetInt32(6) + " OS: " + reader.GetString(8));
                            }
                        }
                    }
                }
            }
            catch (Exception error)
            {
                MessageBox.Show(Convert.ToString(error));
                throw;
            }
        }
    }
}