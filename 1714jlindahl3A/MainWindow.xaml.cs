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

namespace _1714jlindahl3A
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        System.Windows.Data.CollectionViewSource buildingViewSource;
        PropertyMgr2ModelContainer dbContext;
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {

            buildingViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("buildingViewSource")));
            // Load data by setting the CollectionViewSource.Source property:
            dbContext = new PropertyMgr2ModelContainer();
            dbContext.Buildings.Load();
            buildingViewSource.Source = dbContext.Buildings.Local;
            dbContext.Configuration.AutoDetectChangesEnabled = true;
        }

        private void firstButton_Click(object sender, RoutedEventArgs e)
        {
            buildingViewSource.View.MoveCurrentToFirst();
        }

        private void backButton_Click(object sender, RoutedEventArgs e)
        {
            buildingViewSource.View.MoveCurrentToPrevious();
        }

        private void nextButton_Click(object sender, RoutedEventArgs e)
        {
            buildingViewSource.View.MoveCurrentToNext();
        }

        private void lastButton_Click(object sender, RoutedEventArgs e)
        {
            buildingViewSource.View.MoveCurrentToLast();
        }

        private void saveButton_Click(object sender, RoutedEventArgs e)
        {
            dbContext.SaveChanges();
        }
    }
}
