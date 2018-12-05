using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Vidly.Models;
using Vidly.ViewModels;

namespace Vidly.Controllers
{
    public class MoviesController : Controller
    {
        private ApplicationDbContext _context;
        // GET: Movies
        public MoviesController()
        {
            _context = new ApplicationDbContext();
        }
        protected override void Dispose(bool disposing)
        {
            _context.Dispose();
        }
        public ActionResult New()
        {
            var genres = _context.Genres.ToList();
            var viewModel = new MovieFormViewModel
            {
                Genres = genres
            };

            return View(viewModel);
        }
        [HttpPost]
        public ActionResult Save(Movie movie)
        {
            if (movie.Id == 0)
            {
                try
                {
                    movie.NumberInStock = 1;
                    movie.NumberAvailable = 1;
                    _context.Movies.Add(movie);
                }
                catch (DbEntityValidationException e)
                {
                    throw;
                }
            }
            else
            {
                var moviesInDb = _context.Movies.Single(c => c.Id == movie.Id);

                moviesInDb.Name = movie.Name;
                moviesInDb.ReleaseDate = movie.ReleaseDate;
                moviesInDb.GenreId = movie.GenreId;
            }

            _context.SaveChanges();

            return RedirectToAction("Index", "Movies");
        }
        // GET: Movies
        public ActionResult Random()
        {
            var movie = new Movie() { Name = "Shrek!" };
            var customers = new List<Customer>
            {
                new Customer {Name="Customer1"},
                new Customer {Name="Customer2"}
            };

            var viewModel = new RandomMovieViewModel
            {
                Movie = movie,
                Customers = customers
            };

            return View(viewModel);
            //return View(movie);
            //ViewData["Movie"] = movie;
            //ViewBag.Name = movie;
        }

        public ActionResult Edit(int id)
        {
            return Content("id=" + id);
        }
        //movies
        public ViewResult Index()
        {
            var movies = _context.Movies.Include(c => c.Genre).ToList();
            return View(movies);
        }
        public ViewResult Details(int id)
        {
            var movie = _context.Movies.Include(c => c.Genre).SingleOrDefault(c => c.Id == id);
            return View(movie);
        }
        [Route("movies/released/{month}/{year}")]
        public ActionResult ByReleaseDate(int year, int month)
        {

            return Content(year + "/" + month);
        }
    }
}