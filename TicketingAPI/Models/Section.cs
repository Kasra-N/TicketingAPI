using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace TicketingAPI.Models {
    public class Section {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int SectionId { get; set; }
        [Required]
        public String SectionName { get; set; }

        [Required]
        [ForeignKey("VenueId")]
        public virtual Venue Venue { get; set; }
        public virtual ICollection<Row> Rows { get; set; }
    }
}
