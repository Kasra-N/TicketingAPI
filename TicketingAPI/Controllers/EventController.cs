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
    public class EventController : ControllerBase {
        private readonly TicketingContext _context;

        public EventController(TicketingContext context) {
            _context = context;
        }

        /// <summary>
        /// Retrieve all of the events.
        /// </summary>
        /// <returns>A string status</returns>
        [Route("[controller]")]
        [HttpGet]
        public IEnumerable<EventViewModel> GetAll() {
            EventRepository eventRepo = new EventRepository(_context);
            return eventRepo.GetAllEvents();
        }

        /// <summary>
        /// Retrieve the events by Id.
        /// </summary>
        /// <param name="eventId">The eventId of the desired event</param>
        /// <returns>A string status</returns>
        [HttpGet("[controller]/{eventId}")]
        public IActionResult GetById(int eventId) {
            EventRepository eventRepo = new EventRepository(_context);
            var theEvent = _context.Event.FirstOrDefault(e => e.EventId == eventId);

            if (theEvent == null) {
                return NotFound($"Event ID {eventId} not found");
            }

            return new ObjectResult(eventRepo.GetEvent(theEvent));
        }
    }
}