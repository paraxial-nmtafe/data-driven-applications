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

namespace calculator_2
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private string currentNumber;
        private string currentOperator;
        private int workingNumber;
        public MainWindow()
        {
            InitializeComponent();
            currentNumber = "";
            currentOperator = "";
            workingNumber = 0;
        }

        public void Number_Click(object sender, RoutedEventArgs e)
        {
            Button pressedButton = (Button)sender;
            int actualNumber = int.Parse((string)pressedButton.Content);

            currentNumber += actualNumber;
            CalculatorDisplay.Text = currentNumber;
        }

        public void Operator_Click(object sender, RoutedEventArgs e)
        {
            Button pressedButton = (Button)sender;
            currentOperator = (string)pressedButton.Content;
            workingNumber = int.Parse(currentNumber);
            currentNumber = "";

            CalculatorDisplay.Text = currentOperator;
        }

        public void Equals_Click(object sender, RoutedEventArgs e)
        {
            int secondNumber = int.Parse(currentNumber);
            int result = 0;
            switch (currentOperator)
            {
                case "➕":
                    result = workingNumber + secondNumber;
                    break;
                case "➖":
                    result = workingNumber - secondNumber;
                    break;
                case "✖️":
                    result = workingNumber * secondNumber;
                    break;
                case "➗":
                    result = workingNumber / secondNumber;
                    break;
            }

            CalculatorDisplay.Text = result.ToString();
            workingNumber = result;
            currentNumber = "";
            currentOperator = "";
        }

    }
}