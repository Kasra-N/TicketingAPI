using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TicketingAPI.Data;
using TicketingAPI.Models;

namespace TicketingAPI.ViewModels {
    public class VenueViewModel {
        public int VenueId { get; set; }
        public String VenueName { get; set; }
        public int SeatCapacity { get; set; }
        //public int NumOfSections { get; set; }
        public ICollection<String> SectionNames { get; set; }
        public int UpcomingEvents { get; set; }
    }

    public class VenueUpcomingEventsViewModel {
        public int VenueId { get; set; }
        public String VenueName { get; set; }
        public ICollection<VenueEventDetailViewModel> Events { get; set; }
    }

    public class VenueEventDetailViewModel {
        public int EventId { get; set; }
        public String EventName { get; set; }
        public DateTime EventDateTime { get; set; }
        public int TotalEventSeats { get; set; }
        public int AvailableEventSeats { get; set; }
    }
}
