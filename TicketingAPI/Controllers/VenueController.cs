using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TicketingAPI.Data;
using TicketingAPI.Models;
using TicketingAPI.Repositories;
using TicketingAPI.ViewModels;

namespace TicketingAPI.Controllers
{

    [Route("api/[controller]")]
    [ApiController]
    public class VenueController : ControllerBase {
        private readonly TicketingContext _context;

        public VenueController(TicketingContext context) {
            _context = context;
        }

        /// <summary>
        /// Get all venues
        /// </summary>
        /// <returns>A string status</returns>
        [HttpGet]
        public IEnumerable<VenueViewModel> GetAll() {
            VenueRepository venueRepo = new VenueRepository(_context);
            return venueRepo.GetAllVenues();
        }

        /// <summary>
        /// Get venue by Id
        /// </summary>
        /// <param name="venueId">The Id of the desired venue</param>
        /// <returns>A string status</returns>
        [HttpGet("{venueId}")]
        public IActionResult GetById(int venueId) {
            VenueRepository venueRepo = new VenueRepository(_context);
            var venue = _context.Venue.FirstOrDefault(v => v.VenueId == venueId);

            if (venue == null) {
                return NotFound($"Venue '{venueId}' Not Found");
            }

            return new ObjectResult(venueRepo.GetVenueById(venue));
        }

        /// <summary>
        /// Get upcoming events by venueId.
        /// </summary>
        /// <param name="venueId">The Id of the desired venue</param>
        /// <returns>A string status</returns>
        [HttpGet("{venueId}/events")]
        public IActionResult GetUpcomingEvents(int venueId) {
            VenueRepository venueRepo = new VenueRepository(_context);
            var venue = _context.Venue.FirstOrDefault(v => v.VenueId == venueId);

            if (venue == null) {
                return NotFound($"Venue '{venueId}' Not Found");
            }

            return new ObjectResult(venueRepo.GetEvents(venue));
        }

    }
}