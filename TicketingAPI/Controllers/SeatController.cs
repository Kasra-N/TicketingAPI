using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TicketingAPI.Data;
using TicketingAPI.Repositories;

namespace TicketingAPI.Controllers
{
    [Route("api/")]
    [ApiController]
    public class SeatController : ControllerBase {
        private readonly TicketingContext _context;

        public SeatController(TicketingContext context) {
            _context = context;
        }

        /// <summary>
        /// Retrieve the section row by venue Id, section name, and row name.
        /// </summary>
        /// <param name="venueId">The Id of the desired venue</param>
        /// <param name="sectionName">The Id of the desired venue</param>
        /// <param name="rowName">The name of the desired section</param>
        /// <returns>A string status</returns>
        [Route("venue/{venueId}/section/{sectionName}/row/{rowName}/[controller]")]
        [HttpGet]
        public IActionResult GetSectionRow (int venueId, string sectionName, string rowName) {
            SeatRepository seatRepo = new SeatRepository(_context);

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

            return Ok(seatRepo.GetAllRowSeats(row));
        }

        /// <summary>
        /// Retrieve the seat by venue Id, section name, and row name.
        /// </summary>
        /// <param name="venueId">The Id of the desired venue</param>
        /// <param name="sectionName">The Id of the desired venue</param>
        /// <param name="rowName">The name of the desired section</param>
        /// <returns>A string status</returns>
        [Route("venue/{venueId}/section/{sectionName}/row/{rowName}/[controller]/{seatName}")]
        [HttpGet]
        public IActionResult GetSeat(int venueId, string sectionName, string rowName, string seatName) {
            SeatRepository seatRepo = new SeatRepository(_context);

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

            var seat = _context.Seat.FirstOrDefault(st => (st.Row.RowId == row.RowId) &&
                                                          (st.SeatName == seatName));
            if (seat == null) {
                return NotFound($"Seat '{seatName}' Not Found in Row '{rowName}");
            }

            return Ok(seatRepo.GetSeat(seat));
        }
    }
}