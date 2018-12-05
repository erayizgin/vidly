using System;
using System.Collections.Generic;
using System.Data.Entity;
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