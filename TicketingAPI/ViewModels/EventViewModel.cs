using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TicketingAPI.ViewModels {
    public class EventViewModel {
        public int EventId { get; set; }
        public String EventName { get; set; }
        public DateTime EventDateTime { get; set; }
        public int VenueId { get; set; }
        public string VenueName { get; set; }
        public int TotalEventSeats { get; set; }
        public int AvailableEventSeats { get; set; }
    }
}
