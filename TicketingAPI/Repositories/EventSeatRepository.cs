using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TicketingAPI.Data;
using TicketingAPI.Models;
using TicketingAPI.ViewModels;

namespace TicketingAPI.Repositories {
    public class EventSeatRepository {
        private readonly TicketingContext _context;

        public EventSeatRepository(TicketingContext context) {
            _context = context;
        }

        public EventSeatViewModel GetEventSeats(Event theEvent) {
            var venueInfo = _context.Event.Where(e => e.EventId == theEvent.EventId)
                                          .Select(e => e.Venue)
                                          .FirstOrDefault();

            var eventSeats = new EventSeatViewModel {
                    EventId         = theEvent.EventId,
                    EventName       = theEvent.EventName,
                    EventDateTime   = theEvent.EventDateTime,
                    VenueId         = venueInfo.VenueId,
                    VenueName       = venueInfo.VenueName,
                    EventSoldSeats  = _context.EventSeat.Where(es => (es.Event.EventId == theEvent.EventId) &&
                                                                     (es.TicketPurchase.TicketPurchaseId != null))
                                                        .OrderBy(es => es.Seat.Row.Section.SectionName)
                                                            .ThenBy(es => es.Seat.Row.RowName)
                                                            .ThenBy(es => es.Seat.SeatName)
                                                        .Select(es => new EventSeatDetailViewModel {
                                                            EventSeatId      = es.EventSeatId,
                                                            SeatName         = es.Seat.SeatName,
                                                            RowName          = es.Seat.Row.RowName,
                                                            SectionName      = es.Seat.Row.Section.SectionName,
                                                            EventSeatPrice   = (es.EventSeatPrice + es.Seat.Price)
                                                        }).ToList(),
                    EventAvailableSeats = _context.EventSeat.Where(es => (es.Event.EventId == theEvent.EventId) &&
                                                                         (es.TicketPurchase.TicketPurchaseId == null))
                                                            .OrderBy(es => es.Seat.Row.Section.SectionName)
                                                                .ThenBy(es => es.Seat.Row.RowName)
                                                                .ThenBy(es => es.Seat.SeatName)
                                                            .Select(es => new EventSeatDetailViewModel {
                                                                EventSeatId      = es.EventSeatId,
                                                                SeatName         = es.Seat.SeatName,
                                                                RowName          = es.Seat.Row.RowName,
                                                                SectionName      = es.Seat.Row.Section.SectionName,
                                                                EventSeatPrice   = (es.EventSeatPrice + es.Seat.Price)
                                                            }).ToList()
            };
            return eventSeats;
        }

        public EventSeatQueryDetailViewModel GetEventSeat(EventSeat theSeat) {
            var eventSeat = _context.EventSeat.Where(es => es.EventSeatId == theSeat.EventSeatId)
                                              .Select(es => new EventSeatQueryDetailViewModel {
                                                  EventId       = es.Event.EventId,
                                                  EventName     = es.Event.EventName,
                                                  EventDateTime = es.Event.EventDateTime,
                                                  VenueId       = es.Seat.Row.Section.Venue.VenueId,
                                                  VenueName     = es.Seat.Row.Section.Venue.VenueName,
                                                  EventSeatId   = es.EventSeatId,
                                                  SeatName      = es.Seat.SeatName,
                                                  RowName       = es.Seat.Row.RowName,
                                                  SectionName   = es.Seat.Row.Section.SectionName,
                                                  EventSeatPrice = (es.EventSeatPrice + es.Seat.Price),
                                                  Available     = es.TicketPurchase.TicketPurchaseId == null ? true : false
                                              }).FirstOrDefault();
            return eventSeat;
        }

    }
}
