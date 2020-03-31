using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using TicketingAPI.Models;

namespace TicketingAPI.ViewModels {
    public class SeatViewModel {
        public int VenueId { get; set; }
        public String VenueName { get; set; }
        public int SectionId { get; set; }
        public string SectionName { get; set; }
        public int RowId { get; set; }
        public String RowName { get; set; }
        public ICollection<SeatDetailViewModel> Seats { get; set; }
    }

    public class SeatDetailViewModel {
        public int SeatId { get; set; }
        public String SeatName { get; set; }
        [DisplayFormat(DataFormatString = "{0:c}")]
        public decimal Price { get; set; }
    }

}
