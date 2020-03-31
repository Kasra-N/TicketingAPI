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

    [Route("api/")]
    [ApiController]
    public class SectionController : ControllerBase {
        private readonly TicketingContext _context;

        public SectionController(TicketingContext context) {
            _context = context;
        }


        /// <summary>
        /// Retrieve all sections.
        /// </summary>
        /// <returns>A string status</returns>
        [Route("[controller]")]
        [HttpGet]
        public IEnumerable<SectionViewModel> GetAllSections() {
            SectionRepository sectionRepo = new SectionRepository(_context);

            return sectionRepo.GetAllSections();

        }

        /// <summary>
        /// Retrieve the section by venue Id.
        /// </summary>
        /// <param name="venueId">The Id of the desired venue</param>
        /// <returns>A string status</returns>
        [Route("venue/{venueId}/[controller]")]
        [HttpGet]
        public IActionResult GetVenueSections(int venueId) {
            SectionRepository sectionRepo = new SectionRepository(_context);
            var venue = _context.Venue.FirstOrDefault(v => v.VenueId == venueId);

            if (venue == null) {
                return NotFound($"Venue '{venueId}' Not Found");
            }

            return Ok(sectionRepo.GetVenueSections(venue));
        }

        /// <summary>
        /// Retrieve the seat by venue Id and section name.
        /// </summary>
        /// <param name="venueId">The Id of the desired venue</param>
        /// <param name="sectionName">The Id of the desired venue</param>
        /// <returns>A string status</returns>
        [Route("venue/{venueId}/[controller]/{sectionName}")]
        [HttpGet]
        public IActionResult GetSection(int venueId, string sectionName) {
            SectionRepository sectionRepo = new SectionRepository(_context);
            var venue = _context.Venue.FirstOrDefault(v => v.VenueId == venueId);

            if (venue == null) {
                return NotFound($"Venue '{venueId}' Not Found");
            }

            var section = _context.Section.FirstOrDefault(s => (s.Venue.VenueId == venue.VenueId) &&
                                                               (s.SectionName == sectionName));

            if (section == null) {
                return NotFound($"Section '{sectionName}' Not Found for Venue '{venueId}'");
            }

            return Ok(sectionRepo.GetSection(section));
        }
    }
}