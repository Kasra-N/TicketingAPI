using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TicketingAPI.Data;
using TicketingAPI.Models;
using TicketingAPI.ViewModels;

namespace TicketingAPI.Repositories {
    public class TicketPurchaseRepository {
        private readonly TicketingContext _context;

        public TicketPurchaseRepository(TicketingContext context) {
            _context = context;
        }

        public IEnumerable<TicketPurchaseViewModel> GetAllPurchases() {
            var tickets = _context.TicketPurchase.Select(t => new TicketPurchaseViewModel {
                TicketPurchaseId    = t.TicketPurchaseId,
                PaymentMethod       = t.PaymentMethod,
                PaymentAmount       = t.PaymentAmount,
                ConfirmationCode    = t.ConfirmationCode,
                Seats               = _context.EventSeat.Where(es => es.TicketPurchase.TicketPurchaseId == t.TicketPurchaseId)
                                            .Select(es => new TicketSeatDetailViewModel {
                                                EventSeatId     = es.EventSeatId,
                                                EventId         = es.Event.EventId,
                                                EventName       = es.Event.EventName,
                                                VenueName       = es.Event.Venue.VenueName,
                                                SeatName        = es.Seat.SeatName,
                                                RowName         = es.Seat.Row.RowName,
                                                SectionName     = es.Seat.Row.Section.SectionName,
                                                EventSeatPrice  = (es.EventSeatPrice + es.Seat.Price)
                }).ToList()
            });

            return tickets;
        }

        public IEnumerable<TicketPurchaseViewModel> GetAllPurchasesEvent(Event theEvent) {
            List<TicketPurchaseViewModel> soldSeats = new List<TicketPurchaseViewModel>();

            var purchaseIds = _context.EventSeat.Where(e => e.Event.EventId == theEvent.EventId)
                                                .Select(e => e.TicketPurchase.TicketPurchaseId)
                                                .Distinct().ToList();

            if (purchaseIds != null) {
                foreach (int? purchaseId in purchaseIds) {
                    var purchase = _context.TicketPurchase
                        .Where(t => t.TicketPurchaseId == purchaseId)
                        .Select(t => new TicketPurchaseViewModel {
                            TicketPurchaseId    = t.TicketPurchaseId,
                            PaymentMethod       = t.PaymentMethod,
                            PaymentAmount       = t.PaymentAmount,
                            ConfirmationCode    = t.ConfirmationCode,
                            Seats = _context.EventSeat.Where(es => es.TicketPurchase.TicketPurchaseId == t.TicketPurchaseId)
                                                      .Select(es => new TicketSeatDetailViewModel {
                                                          EventSeatId   = es.EventSeatId,
                                                          EventId       = es.Event.EventId,
                                                          EventName     = es.Event.EventName,
                                                          VenueName     = es.Event.Venue.VenueName,
                                                          SeatName      = es.Seat.SeatName,
                                                          RowName       = es.Seat.Row.RowName,
                                                          SectionName   = es.Seat.Row.Section.SectionName,
                                                          EventSeatPrice = (es.EventSeatPrice + es.Seat.Price)
                                                      }).ToList()
                    }).FirstOrDefault();

                    soldSeats.Add(purchase);
                }
                //Fix for Nulled First Value
                soldSeats.RemoveAt(0);
            }

            return soldSeats;
        }


        public TicketPurchaseViewModel GetTicketPurchase(TicketPurchase ticketPurchase) {

            var purchase = _context.TicketPurchase.Where(t => t.TicketPurchaseId == ticketPurchase.TicketPurchaseId)
                .Select(t => new TicketPurchaseViewModel {
                    TicketPurchaseId    = t.TicketPurchaseId,
                    PaymentMethod       = t.PaymentMethod,
                    PaymentAmount       = t.PaymentAmount,
                    ConfirmationCode    = t.ConfirmationCode,
                    Seats = _context.EventSeat.Where(es => es.TicketPurchase.TicketPurchaseId == t.TicketPurchaseId)
                                    .Select(es => new TicketSeatDetailViewModel {
                                        EventSeatId     = es.EventSeatId,
                                        EventId         = es.Event.EventId,
                                        EventName       = es.Event.EventName,
                                        VenueName       = es.Event.Venue.VenueName,
                                        SeatName        = es.Seat.SeatName,
                                        RowName         = es.Seat.Row.RowName,
                                        SectionName     = es.Seat.Row.Section.SectionName,
                                        EventSeatPrice  = (es.EventSeatPrice + es.Seat.Price)
                                    }).ToList()
                }).FirstOrDefault();

            return purchase;
        }

        public bool CreateTicketPurchase(TicketPurchaseJSON ticketPurchase) {
            bool isSuccessful = false;

            try {
                TicketPurchase purchase = new TicketPurchase {
                    PaymentMethod = ticketPurchase.PaymentMethod,
                    PaymentAmount = ticketPurchase.PaymentAmount,
                    ConfirmationCode = ticketPurchase.ConfirmationCode
                };

                _context.TicketPurchase.Add(purchase);

                foreach (int eventSeatId in ticketPurchase.EventSeatsPurchased) {
                    EventSeat seat = _context.EventSeat
                                        .Where(es => es.EventSeatId == eventSeatId)
                                        .FirstOrDefault();

                    if (seat != null && seat.TicketPurchase == null) {
                        seat.TicketPurchase = purchase;
                    }
                    else {
                        _context.TicketPurchase.Remove(purchase);
                        _context.SaveChanges();
                        throw new System.ArgumentException("Seat ID Invalid");
                    }
                }

                _context.SaveChanges();
                isSuccessful = true;
            } catch (Exception e) {

            }


            return isSuccessful;
        }

        public string CancelTicketPurchase(TicketPurchase purchase) {
            var purchasedSeats = _context.EventSeat
                                    .Where(s => s.TicketPurchase.TicketPurchaseId == purchase.TicketPurchaseId)
                                    .ToList();

            foreach (EventSeat seat in purchasedSeats) {
                seat.TicketPurchase = null;
            }

            _context.TicketPurchase.Remove(purchase);
            _context.SaveChanges();

            return $"Cancelled Purchase: {purchase.TicketPurchaseId}";
        }        
    }
}
