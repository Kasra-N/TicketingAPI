using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TicketingAPI.ViewModels {
    public class EventSeatViewModel {
        public int EventId { get; set; }
        public String EventName { get; set; }
        public DateTime EventDateTime { get; set; }
        public int VenueId { get; set; }
        public string VenueName { get; set; }
        public ICollection<EventSeatDetailViewModel> EventSoldSeats { get; set; }
        public ICollection<EventSeatDetailViewModel> EventAvailableSeats { get; set; }
    }

    public class EventSeatDetailViewModel {
        public int EventSeatId { get; set; }
        public String SeatName { get; set; }
        public String RowName { get; set; }
        public String SectionName { get; set; }
        public decimal EventSeatPrice { get; set; }
    }

    public class EventSeatQueryDetailViewModel {
        public int EventId { get; set; }
        public String EventName { get; set; }
        public DateTime EventDateTime { get; set; }
        public int VenueId { get; set; }
        public string VenueName { get; set; }
        public int EventSeatId { get; set; }
        public String SeatName { get; set; }
        public String RowName { get; set; }
        public String SectionName { get; set; }
        public decimal EventSeatPrice { get; set; }
        public bool Available { get; set; }

    }
}
