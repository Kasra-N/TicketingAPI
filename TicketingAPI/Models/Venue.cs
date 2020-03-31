using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

namespace TicketingAPI.Models {
    public class Venue {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int VenueId { get; set; }
        [Required]
        public String VenueName { get; set; }

        public virtual ICollection<Section> Sections { get; set; }
        public virtual ICollection<Event> Events { get; set; }
    }
}
