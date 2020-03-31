using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TicketingAPI.Data;
using TicketingAPI.Models;
using TicketingAPI.ViewModels;

namespace TicketingAPI.Repositories {
    public class EventRepository {

        private readonly TicketingContext _context;

        public EventRepository(TicketingContext context) {
            _context = context;
        }

        public IEnumerable<EventViewModel> GetAllEvents() {
            var events = _context.Event
                .Select(v => new EventViewModel {
                    EventId         = v.EventId,
                    EventName       = v.EventName,
                    EventDateTime   = v.EventDateTime, 
                    VenueId         = v.Venue.VenueId,
                    VenueName       = v.Venue.VenueName,
                    TotalEventSeats = v.EventSeats.Where(st => st.Event.EventId == v.EventId).Count(),
                    AvailableEventSeats = v.EventSeats.Where(st => (st.Event.EventId == v.EventId) &&
                                                                   (st.TicketPurchase.TicketPurchaseId == null))
                                                      .Count()
                });

            return events;
        }

        public EventViewModel GetEvent(Event theEvent) {
            var venueInfo = _context.Event.Where(e => e.EventId == theEvent.EventId)
                                          .Select(e => e.Venue)
                                          .FirstOrDefault();


            var eventDetail = new EventViewModel {
                EventId             = theEvent.EventId,
                EventName           = theEvent.EventName,
                EventDateTime       = theEvent.EventDateTime,
                VenueId             = venueInfo.VenueId,
                VenueName           = venueInfo.VenueName,
                TotalEventSeats     = _context.EventSeat.Where(st => st.Event.EventId == theEvent.EventId).Count(),
                AvailableEventSeats = _context.EventSeat.Where(st => (st.Event.EventId == theEvent.EventId) &&
                                                                     (st.TicketPurchase.TicketPurchaseId == null))
                                                        .Count()
            };

            return eventDetail;
        }
    }
}
