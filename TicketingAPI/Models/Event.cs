using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace TicketingAPI.Models {
    public class Event {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int EventId { get; set; }
        [Required]
        public String EventName { get; set; }
        [Required]
        public DateTime EventDateTime { get; set; }

        [ForeignKey("VenueId")]
        public virtual Venue Venue { get; set; }
        public virtual ICollection<EventSeat> EventSeats { get; set; }
    }
}
