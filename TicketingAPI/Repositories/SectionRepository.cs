using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TicketingAPI.Data;
using TicketingAPI.Models;
using TicketingAPI.ViewModels;

namespace TicketingAPI.Repositories {
    public class SectionRepository {

        private readonly TicketingContext _context;

        public SectionRepository(TicketingContext context) {
            _context = context;
        }

        public IEnumerable<SectionViewModel> GetAllSections() {
            var sections = _context.Venue
                .Select(v => new SectionViewModel {
                    VenueId         = v.VenueId,
                    VenueName       = v.VenueName,
                    NumOfSections   = _context.Section
                                       .Where(section => section.Venue.VenueId == v.VenueId)
                                       .Count(),
                    Sections        = _context.Section.Where(s => s.Venue.VenueId == v.VenueId)
                                        .Select(s => new SectionDetailViewModel {
                                            SectionId           = s.SectionId,
                                            SectionName         = s.SectionName,
                                            SectionSeatCapacity = (from seat in _context.Seat
                                                                   join row in _context.Row on seat.Row.RowId equals row.RowId
                                                                   join section in _context.Section on row.Section.SectionId equals section.SectionId
                                                                   where row.Section.SectionId == s.SectionId
                                                                   select seat).Count(),
                                            RowNames = _context.Row
                                                                         .Where(row => row.Section.SectionId == s.SectionId)
                                                                         .Select(row => row.RowName)
                                                                         .ToList()
                                        }).ToList()
                });

            return sections;
        }

        public SectionViewModel GetVenueSections(Venue theVenue) {
            var sections = new SectionViewModel {
                VenueId             = theVenue.VenueId,
                VenueName           = theVenue.VenueName,
                NumOfSections       = _context.Section
                                        .Where(section => section.Venue.VenueId == theVenue.VenueId)
                                        .Count(),
                Sections            = _context.Section.Where(s => s.Venue.VenueId == theVenue.VenueId)
                                        .Select(s => new SectionDetailViewModel {
                                            SectionId           = s.SectionId,
                                            SectionName         = s.SectionName,
                                            SectionSeatCapacity = (from seat in _context.Seat
                                                                    join row in _context.Row on seat.Row.RowId equals row.RowId
                                                                    join section in _context.Section on row.Section.SectionId equals section.SectionId
                                                                    where row.Section.SectionId == s.SectionId
                                                                   select seat).Count(),
                                            RowNames = _context.Row
                                                                        .Where(row => row.Section.SectionId == s.SectionId)
                                                                        .Select(row => row.RowName)
                                                                        .ToList()
                                        }).ToList()
            };

            return sections;
        }

        public SectionViewModel GetSection(Section theSection) {
                return new SectionViewModel {
                    VenueId             = theSection.Venue.VenueId,
                    VenueName           = theSection.Venue.VenueName,
                    NumOfSections       = _context.Section
                                       .Where(section => section.Venue.VenueId == theSection.Venue.VenueId)
                                       .Count(),
                    Sections            = _context.Section
                                            .Where(s => s.SectionId == theSection.SectionId)
                                            .Select(s => new SectionDetailViewModel {
                                                SectionId           = s.SectionId,
                                                SectionName         = s.SectionName,
                                                SectionSeatCapacity = (from seat in _context.Seat
                                                                       join row in _context.Row on seat.Row.RowId equals row.RowId
                                                                       join section in _context.Section on row.Section.SectionId equals section.SectionId
                                                                       where row.Section.SectionId == s.SectionId
                                                                       select seat).Count(),
                                                RowNames = _context.Row
                                                                            .Where(row => row.Section.SectionId == s.SectionId)
                                                                            .Select(row => row.RowName)
                                                                            .ToList()
                                            }).ToList()
                };
        }
    }
}
