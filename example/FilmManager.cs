using System;
using System.Collections.Generic;
using System.Text;
using System.Windows;

namespace example
{
    class FilmManager
    {
        private DataLayer dataLayer;
        private List<Film> _films;

        public List<Film> films {  get { return _films; } }
        public FilmManager()
        {
            dataLayer = new DataLayer();
            refreshFilms();
        }

        public void AddFilm(Film film)
        {
            bool success = dataLayer.SaveFilm(film);
            if (success)
            {
                refreshFilms();
            } else
            {
                MessageBox.Show("All fields must be filled");
            }
        }

        private void refreshFilms()
        {
            _films = dataLayer.GetFilms();
        }
    }
}