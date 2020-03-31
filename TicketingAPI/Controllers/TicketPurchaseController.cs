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
    [Route("api/[controller]")]
    [ApiController]
    public class TicketPurchaseController : ControllerBase {
        private readonly TicketingContext _context;

        public TicketPurchaseController(TicketingContext context) {
            _context = context;
        }

        /// <summary>
        /// Retrieve all tickets purchased
        /// </summary>
        /// <returns>A string status</returns>
        [HttpGet]
        public IEnumerable<TicketPurchaseViewModel> GetAll() {
            TicketPurchaseRepository ticketPurchaseRepo = new TicketPurchaseRepository(_context);

            return ticketPurchaseRepo.GetAllPurchases();
        }

        /// <summary>
        /// Retrieve ticket purchased by eventId.
        /// </summary>
        /// <param name="eventId">The Id of the desired venue</param>
        /// <returns>A string status</returns>
        [Route("{eventId}")]
        [HttpGet]
        public IActionResult GetAllEventPurchases(int eventId) {
            TicketPurchaseRepository ticketPurchaseRepo = new TicketPurchaseRepository(_context);
            var theEvent = _context.Event.Where(e => e.EventId == eventId).FirstOrDefault();

            if (theEvent == null) {
                return NotFound($"Event ID {eventId} not found");
            }

            return Ok(ticketPurchaseRepo.GetAllPurchasesEvent(theEvent));
        }

        /// <summary>
        /// Retrieve ticket purchased by ticketPurchaseId
        /// </summary>
        /// <param name="ticketPurchaseId">The Id of the desired venue</param>
        /// <returns>A string status</returns>
        [Route("id/{ticketPurchaseId}")]
        [HttpGet]
        public IActionResult GetTicketPurchase(int ticketPurchaseId) {
            TicketPurchaseRepository ticketPurchaseRepo = new TicketPurchaseRepository(_context);
            var ticketPurchase = _context.TicketPurchase.FirstOrDefault(t => t.TicketPurchaseId == ticketPurchaseId);

            if (ticketPurchase == null) {
                return NotFound($"Ticket Purchase '{ticketPurchaseId}' not found");
            }

            return Ok(ticketPurchaseRepo.GetTicketPurchase(ticketPurchase));
        }

        /// <summary>
        /// Create ticket purchased
        /// </summary>
        /// <returns>A string status</returns>
        [HttpPost]
        public IActionResult Create([FromBody] TicketPurchaseJSON ticketPurchase) {
            TicketPurchaseRepository ticketPurchaseRepo = new TicketPurchaseRepository(_context);

            if (ticketPurchase.EventSeatsPurchased.Count == 0) {
                return BadRequest("No Seats In Transaction");
            } else if (String.IsNullOrWhiteSpace(ticketPurchase.PaymentMethod)) {
                return BadRequest("Payment Method Missing");
            } else if (ticketPurchase.PaymentAmount < 0) {
                return BadRequest("Payment Amount Cannot Be Negative");
            } else if (String.IsNullOrWhiteSpace(ticketPurchase.ConfirmationCode)) {
                return BadRequest("Payment Amount Cannot Be Negative");
            }

            if (!ticketPurchaseRepo.CreateTicketPurchase(ticketPurchase)) {
                return BadRequest("Unable To Purchase Seats, Please Check Your Transaction Details (e.g Seat May Not Be Available For Sale) and Try Again");
            }

            return new ObjectResult(ticketPurchase);
        }

        /// <summary>
        /// Delete ticket purchased
        /// </summary>
        /// <param name="ticketPurchaseId">The Id of the desired venue</param>
        /// <param name="ConfirmationCode">The Id of the desired venue</param>
        /// <returns>A string status</returns>
        [Route("Cancel/{ticketPurchaseId}/Confirmation/{confirmationCode}")]
        [HttpDelete]
        public IActionResult Delete(int ticketPurchaseId, String ConfirmationCode) {
            TicketPurchaseRepository ticketPurchaseRepo = new TicketPurchaseRepository(_context);

            TicketPurchase purchase = _context.TicketPurchase.FirstOrDefault(tp => (tp.TicketPurchaseId == ticketPurchaseId) &&
                                                                                  (tp.ConfirmationCode == ConfirmationCode));

            if (purchase == null) {
                return BadRequest("Purchase Details Provided To Not Match Any Transactions On File (Purchase ID + Confirmation Code)");
            }


            return Ok(ticketPurchaseRepo.CancelTicketPurchase(purchase));
        }
    }
}