using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TicketingAPI.Data;
using TicketingAPI.Models;
using TicketingAPI.ViewModels;

namespace TicketingAPI.Repositories {
    public class RowRepository {
        private readonly TicketingContext _context;

        public RowRepository(TicketingContext context) {
            _context = context;
        }

        public RowViewModel GetSectionRows(Section theSection) {
            var theSeats = new RowViewModel {
                VenueId             = theSection.Venue.VenueId,
                VenueName           = theSection.Venue.VenueName,
                SectionId           = theSection.SectionId,
                SectionName         = theSection.SectionName,
                SectionSeatCapacity = (from seat in _context.Seat
                                       join row in _context.Row on seat.Row.RowId equals row.RowId
                                       join section in _context.Section on row.Section.SectionId equals section.SectionId
                                       where row.Section.SectionId == theSection.SectionId
                                       select seat).Count(),
                Rows                = _context.Row.Where(r => r.Section.SectionId == theSection.SectionId)
                                                    .Select(r => new RowDetailViewModel {
                                                        RowId       = r.RowId,
                                                        RowName     = r.RowName,
                                                        SeatNames   = _context.Seat
                                                                        .Where(se => se.Row.RowId == r.RowId)
                                                                        .Select(se => se.SeatName).ToList()
                                                    }).ToList()
            };
            return theSeats;
        }

        public RowViewModel GetSectionRow(Row theRow) {
            var theSeat = new RowViewModel {
                VenueId             = theRow.Section.Venue.VenueId,
                VenueName           = theRow.Section.Venue.VenueName,
                SectionId           = theRow.Section.SectionId,
                SectionName         = theRow.Section.SectionName,
                SectionSeatCapacity = (from seat in _context.Seat
                                       join row in _context.Row on seat.Row.RowId equals row.RowId
                                       join section in _context.Section on row.Section.SectionId equals section.SectionId
                                       where row.Section.SectionId == theRow.Section.SectionId
                                       select seat).Count(),
                Rows                = _context.Row.Where(r => r.RowId == theRow.RowId)
                                                    .Select(r => new RowDetailViewModel {
                                                        RowId       = r.RowId,
                                                        RowName     = r.RowName,
                                                        SeatNames   = _context.Seat
                                                                        .Where(se => se.Row.RowId == r.RowId)
                                                                        .Select(se => se.SeatName).ToList()
                                                    }).ToList()
            };
            return theSeat;
        }
    }
}
