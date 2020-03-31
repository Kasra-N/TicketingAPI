using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TicketingAPI.ViewModels {
    public class SectionViewModel {
        public int VenueId { get; set; }
        public String VenueName { get; set; }
        public int NumOfSections { get; set; }
        public ICollection<SectionDetailViewModel> Sections { get; set; }
    }

    public class SectionDetailViewModel {
        public int SectionId { get; set; }
        public String SectionName { get; set; }
        public int SectionSeatCapacity { get; set; }
        //public int NumOfRows { get; set; }
        public ICollection<String> RowNames { get; set; }
    }
}
