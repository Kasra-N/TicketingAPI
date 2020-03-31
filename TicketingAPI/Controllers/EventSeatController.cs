using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TicketingAPI.Data;
using TicketingAPI.Models;
using TicketingAPI.Repositories;
using TicketingAPI.ViewModels;

namespace TicketingAPI.Controllers
{
    [Route("api/")]
    [ApiController]
    public class EventSeatController : ControllerBase {
        private readonly TicketingContext _context;

        public EventSeatController(TicketingContext context) {
            _context = context;
        }

        /// <summary>
        /// Retrieve all of the eventSeat.
        /// </summary>
        /// <returns>A string status</returns>
        [Route("event/{eventId}/[controller]")]
        [HttpGet]
        public IActionResult GetAll(int eventId) {
            EventSeatRepository eventSeatRepo = new EventSeatRepository(_context);
            var theEvent = _context.Event.FirstOrDefault(e => e.EventId == eventId);

            if (theEvent == null) {
                return NotFound($"Event ID `{eventId}` not found");
            }

            return Ok(eventSeatRepo.GetEventSeats(theEvent));
        }

        /// <summary>
        /// Retrieve the eventSeat by eventId and eventSeatId.
        /// </summary>
        /// <param name="eventId">The eventId of the desired event</param>
        /// <param name="eventSeatId">The eventSeatId of the desired eventSeat</param>
        /// <returns>A string status</returns>
        [Route("event/{eventId}/[controller]/{eventSeatId}")]
        [HttpGet]
        public IActionResult GetAll(int eventId, int eventSeatId) {
            EventSeatRepository eventSeatRepo = new EventSeatRepository(_context);
            var theEvent = _context.Event.FirstOrDefault(e => e.EventId == eventId);

            if (theEvent == null) {
                return NotFound($"Event ID '{eventId}' not found");
            }

            var theSeat = _context.EventSeat.FirstOrDefault(es => es.EventSeatId == eventSeatId);

            if (theSeat == null) {
                return NotFound($"Event Seat ID '{eventSeatId}' not found");
            }

            return Ok(eventSeatRepo.GetEventSeat(theSeat));
        }
    }
}