using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TicketingAPI.Data;
using TicketingAPI.Models;
using TicketingAPI.ViewModels;

namespace TicketingAPI.Repositories {
    public class SeatRepository {

        private readonly TicketingContext _context;

        public SeatRepository(TicketingContext context) {
            _context = context;
        }

        public SeatViewModel GetAllRowSeats(Row row) {
            var seats = new SeatViewModel {
                VenueId     = row.Section.Venue.VenueId,
                VenueName   = row.Section.Venue.VenueName,
                SectionId   = row.Section.SectionId,
                SectionName = row.Section.SectionName,
                RowId       = row.RowId,
                RowName     = row.RowName,
                Seats       = _context.Seat.Where(s => s.Row.RowId == row.RowId)
                                           .Select(s => new SeatDetailViewModel {
                                                    SeatId      = s.SeatId,
                                                    SeatName    = s.SeatName,
                                                    Price       = s.Price
                                           }).ToList()
            };

            return seats;
        }

        public SeatViewModel GetSeat(Seat seat) {
            var seats = new SeatViewModel {
                VenueId     = seat.Row.Section.Venue.VenueId,
                VenueName   = seat.Row.Section.Venue.VenueName,
                SectionId   = seat.Row.Section.SectionId,
                SectionName = seat.Row.Section.SectionName,
                RowId       = seat.Row.RowId,
                RowName     = seat.Row.RowName,
                Seats       = _context.Seat.Where(s => s.SeatId == seat.SeatId)
                                           .Select(s => new SeatDetailViewModel {
                                               SeatId = s.SeatId,
                                               SeatName = s.SeatName,
                                               Price = s.Price
                                           }).ToList()
            };

            return seats;
        }
    }
}
