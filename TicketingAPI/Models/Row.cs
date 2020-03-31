using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace TicketingAPI.Models {
    public class Row {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int RowId { get; set; }
        [Required]
        public string RowName { get; set; }

        [Required]
        [ForeignKey("SectionId")]
        public virtual Section Section { get; set; }
        public virtual ICollection<Seat> Seats { get; set; }
    }
}
