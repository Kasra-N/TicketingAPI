using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace TicketingAPI.Models {
    public class EventSeat {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int EventSeatId { get; set; }
        [Column(TypeName = "decimal(18,2)")]
        public decimal EventSeatPrice { get; set; }

        [Required]
        [ForeignKey("EventId")]
        public virtual Event Event { get; set; }

        [Required]
        [ForeignKey("SeatId")]
        public virtual Seat Seat { get; set; }

        [ForeignKey("TicketPurchaseId")]
        public virtual TicketPurchase TicketPurchase { get; set; }

    }
}
