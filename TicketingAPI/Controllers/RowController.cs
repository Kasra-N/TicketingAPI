using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TicketingAPI.Data;
using TicketingAPI.Repositories;
using TicketingAPI.ViewModels;

namespace TicketingAPI.Controllers
{
    [Route("api/")]
    [ApiController]
    public class RowController : ControllerBase {
        private readonly TicketingContext _context;

        public RowController(TicketingContext context) {
            _context = context;
        }

        /// <summary>
        /// Retrieve the section row by  venue Id and section name.
        /// </summary>
        /// <param name="venueId">The Id of the desired venue</param>
        /// <param name="sectionName">The name of the desired section</param>
        /// <returns>A string status</returns>
        [Route("venue/{venueId}/section/{sectionName}/[controller]")]
        [HttpGet]
        public IActionResult GetSectionRows (int venueId, string sectionName) {
            RowRepository rowRepo = new RowRepository(_context);
            var venue = _context.Venue.FirstOrDefault(v => v.VenueId == venueId);

            if (venue == null) {
                return NotFound($"Venue '{venueId}' Not Found");
            }

            var section = _context.Section.FirstOrDefault(s => (s.Venue.VenueId == venue.VenueId) &&
                                                               (s.SectionName == sectionName));
            if (section == null) {
                return NotFound($"Section '{sectionName}' Not Found for Venue '{venueId}'");
            }

            return Ok(rowRepo.GetSectionRows(section));
        }

        /// <summary>
        /// Retrieve the section row by venue Id, section name, and row name.
        /// </summary>
        /// <param name="venueId">The Id of the desired venue</param>
        /// <param name="sectionName">The Id of the desired venue</param>
        /// <param name="rowName">The name of the desired section</param>
        /// <returns>A string status</returns>
        [Route("venue/{venueId}/section/{sectionName}/[controller]/{rowName}")]
        [HttpGet]
        public IActionResult GetSectionRow
            (int venueId, string sectionName, string rowName) {
            RowRepository rowRepo = new RowRepository(_context);
            var venue = _context.Venue.FirstOrDefault(v => v.VenueId == venueId);

            if (venue == null) {
                return NotFound($"Venue '{venueId}' Not Found");
            }

            var section = _context.Section.FirstOrDefault(s => (s.Venue.VenueId == venue.VenueId) &&
                                                               (s.SectionName == sectionName));
            if (section == null) {
                return NotFound($"Section '{sectionName}' Not Found for Venue '{venueId}'");
            }

            var row = _context.Row.FirstOrDefault(r => (r.Section.SectionId == section.SectionId) &&
                                                       (r.RowName == rowName));

            if (row == null) {
                return NotFound($"Row '{rowName}' Not Found for Section '{sectionName}'");
            }

            return Ok(rowRepo.GetSectionRow(row));
        }
    }
}