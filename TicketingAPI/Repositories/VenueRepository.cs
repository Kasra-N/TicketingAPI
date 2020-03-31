using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using TicketingAPI.Data;
using TicketingAPI.Models;
using TicketingAPI.ViewModels;

namespace TicketingAPI.Repositories {
    public class VenueRepository {

        private readonly TicketingContext _context;

        public VenueRepository(TicketingContext context) {
            _context = context;
        }

        public IEnumerable<VenueViewModel> GetAllVenues() {
            var venues = _context.Venue
                .Select(v => new VenueViewModel {
                    VenueId         = v.VenueId,
                    VenueName       = v.VenueName,
                    SeatCapacity    = (from seat in _context.Seat
                                       join row in _context.Row on seat.Row.RowId equals row.RowId
                                       join section in _context.Section on row.Section.SectionId equals section.SectionId
                                       join venue in _context.Venue on section.Venue.VenueId equals venue.VenueId
                                       where venue.VenueId == v.VenueId
                                       select seat).Count(),
                    SectionNames = _context.Section
                                       .Where(section => section.Venue.VenueId == v.VenueId)
                                       .Select(section => section.SectionName)
                                       .ToList(),
                    UpcomingEvents  = _context.Event
                                       .Where(e => (e.Venue.VenueId == v.VenueId) && 
                                                   (e.EventDateTime.Year == DateTime.Now.Year) &&
                                                   (e.EventDateTime >= DateTime.Now))
                                       .Count()
                }) ;

            return venues;
        }

        public VenueViewModel GetVenueById(Venue theVenue) {

            return new VenueViewModel {
                VenueId = theVenue.VenueId,
                VenueName = theVenue.VenueName,
                SeatCapacity = (from seat in _context.Seat
                                join row in _context.Row on seat.Row.RowId equals row.RowId
                                join section in _context.Section on row.Section.SectionId equals section.SectionId
                                join venue in _context.Venue on section.Venue.VenueId equals venue.VenueId
                                where venue.VenueId == theVenue.VenueId
                                select seat).Count(),
                SectionNames = _context.Section
                                    .Where(section => section.Venue.VenueId == theVenue.VenueId)
                                    .Select(section => section.SectionName)
                                    .ToList(),
                UpcomingEvents = _context.Event
                                    .Where(e => (e.Venue.VenueId == theVenue.VenueId) &&
                                                (e.EventDateTime.Year == DateTime.Now.Year) &&
                                                (e.EventDateTime >= DateTime.Now))
                                    .Count()
            };
        }

        public VenueUpcomingEventsViewModel GetEvents(Venue theVenue) {

            return new VenueUpcomingEventsViewModel {
                VenueId = theVenue.VenueId,
                VenueName = theVenue.VenueName,
                Events = _context.Event.Where(e => e.Venue.VenueId == theVenue.VenueId)
                                       .Select(e => new VenueEventDetailViewModel {
                                            EventId         = e.EventId,
                                            EventName       = e.EventName,
                                            EventDateTime   = e.EventDateTime,
                                            TotalEventSeats = e.EventSeats.Count(),
                                            AvailableEventSeats = e.EventSeats.Where(st => st.TicketPurchase.TicketPurchaseId == null)
                                                                              .Count()
                }).ToList()

            };
        }
    }
}
