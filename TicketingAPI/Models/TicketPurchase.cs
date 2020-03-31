using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace TicketingAPI.Models {
    public class TicketPurchase {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int? TicketPurchaseId { get; set; }
        [Required]
        public String PaymentMethod { get; set; }
        [Required]
        [Column(TypeName = "decimal(18,2)")]
        public decimal PaymentAmount { get; set; }
        public String ConfirmationCode { get; set; }

        public virtual ICollection<EventSeat> EventSeats { get; set; }
    }

    public class TicketPurchaseJSON {
        [Required]
        public String PaymentMethod { get; set; }
        [Required]
        [Column(TypeName = "decimal(18,2)")]
        public decimal PaymentAmount { get; set; }
        [Required]
        public String ConfirmationCode { get; set; }
        public List<int> EventSeatsPurchased { get; set; }
    }
}
