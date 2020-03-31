using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using TicketingAPI.Models;

namespace TicketingAPI.Data {
    public class TicketingContext : DbContext {
        public TicketingContext(DbContextOptions<TicketingContext> options) : base(options) {

        }

        public DbSet<Venue> Venue { get; set; }
        public DbSet<Section> Section { get; set; }
        public DbSet<Row> Row { get; set; }
        public DbSet<Seat> Seat { get; set; }
        public DbSet<Event> Event { get; set; }
        public DbSet<EventSeat> EventSeat { get; set; }
        public DbSet<TicketPurchase> TicketPurchase { get; set; }


    }
}
