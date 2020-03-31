using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TicketingAPI.ViewModels {
    public class TicketPurchaseViewModel {
        public int? TicketPurchaseId { get; set; }
        public string PaymentMethod { get; set; }
        public decimal PaymentAmount { get; set; }
        public string ConfirmationCode { get; set; }
        public ICollection<TicketSeatDetailViewModel> Seats { get; set; }
    }

    public class TicketSeatDetailViewModel {
        public int EventSeatId { get; set; }
        public int EventId { get; set; }
        public string EventName { get; set; }
        public string VenueName { get; set; }
        public String SeatName { get; set; }
        public String RowName { get; set; }
        public String SectionName { get; set; }
        public decimal EventSeatPrice { get; set; }
    }
}
