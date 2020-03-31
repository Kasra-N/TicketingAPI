using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.SqlTypes;
using System.Linq;
using System.Threading.Tasks;

namespace TicketingAPI.Models {
    public class Seat {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int SeatId { get; set; }
        
        [Required]
        public string SeatName { get; set; }

        [Column(TypeName = "decimal(18,2)")]
        public decimal Price { get; set; }

        [Required]
        [ForeignKey("RowId")]
        public virtual Row Row { get; set; }
    }
}
