using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TicketingAPI.ViewModels {
    public class RowViewModel {
        public int VenueId { get; set; }
        public String VenueName { get; set; }
        public int SectionId { get; set; }
        public string SectionName { get; set; }
        public int SectionSeatCapacity { get; set; }
        public ICollection<RowDetailViewModel> Rows { get; set; }
    }

    public class RowDetailViewModel {
        public int RowId { get; set; }
        public String RowName { get; set; }
        //public int RowSeatCapacity { get; set; }
        public ICollection<String> SeatNames { get; set; }
    }

}
