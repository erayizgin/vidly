using AutoMapper;
using System;
using System.Data.Entity;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Vidly.Dtos;
using Vidly.Models;

namespace Vidly.Controllers.Api
{
    public class MoviesController : ApiController
    {
        private ApplicationDbContext _context;
        public MoviesController()
        {
            _context = new ApplicationDbContext();
        }

        // GET /api/movies
        public IEnumerable<MovieDto> GetMovies(string query = null)
        {
            var moviesQuery = _context.Movies
                .Include(m => m.Genre)
                .Where(m => m.NumberAvailable > 0);

            if (!String.IsNullOrWhiteSpace(query))
                moviesQuery = moviesQuery.Where(m => m.Name.Contains(query));

            return moviesQuery
                .ToList()
                .Select(Mapper.Map<Movie, MovieDto>);
        }

        //DELETE /api/movies/id
        [HttpDelete]
        public void DeleteMovie(int id)
        {
            var moviesInDB = _context.Movies.SingleOrDefault(m => m.Id == id);
            if (moviesInDB == null)
                throw new HttpResponseException(HttpStatusCode.NotFound);

            _context.Movies.Remove(moviesInDB);
            _context.SaveChanges();
        }
    }
    
}
