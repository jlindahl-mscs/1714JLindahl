using _1714jlindahl2G;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace _1714jlindahl3b2
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        PropertyMgr2ModelContainer dbContext;
        System.Windows.Data.CollectionViewSource apartmentViewSource;
        System.Windows.Data.CollectionViewSource apartmentInvoicesViewSource;


        public MainWindow()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {

            apartmentViewSource = ((System.Windows.Data.CollectionViewSource)
                (this.FindResource("apartmentViewSource")));
            apartmentInvoicesViewSource = ((System.Windows.Data.CollectionViewSource)
                (this.FindResource("apartmentInvoicesViewSource")));
            // Load data by setting the CollectionViewSource.Source property:
            dbContext = new PropertyMgr2ModelContainer();
            dbContext.Apartments.Load();
            apartmentViewSource.Source = dbContext.Apartments.Local;
            dbContext.Configuration.AutoDetectChangesEnabled = true;
        }

        private void firstButton_Click(object sender, RoutedEventArgs e)
        {
            apartmentViewSource.View.MoveCurrentToFirst();
        }

        private void backButton_Click(object sender, RoutedEventArgs e)
        {
            apartmentViewSource.View.MoveCurrentToPrevious();
        }

        private void nextButton_Click(object sender, RoutedEventArgs e)
        {
            apartmentViewSource.View.MoveCurrentToNext();
        }

        private void lastButton_Click(object sender, RoutedEventArgs e)
        {
            apartmentViewSource.View.MoveCurrentToLast();
        }

        private void saveButton_Click(object sender, RoutedEventArgs e)
        {
            dbContext.SaveChanges();
        }

        private void firstInvoiceButton_Click(object sender, RoutedEventArgs e)
        {
            apartmentInvoicesViewSource.View.MoveCurrentToFirst();
        }

        private void backInvoiceButton_Click(object sender, RoutedEventArgs e)
        {
            apartmentInvoicesViewSource.View.MoveCurrentToPrevious();
        }

        private void nextInvoiceButton_Click(object sender, RoutedEventArgs e)
        {
            apartmentInvoicesViewSource.View.MoveCurrentToNext();
        }

        private void lastInvoiceButton_Click(object sender, RoutedEventArgs e)
        {
            apartmentInvoicesViewSource.View.MoveCurrentToLast();
        }
    }
}
