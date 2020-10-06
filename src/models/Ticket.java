package models;

import dao.TicketDAO;

public class Ticket {
    private int ticketNumber, customerId, eventId;
    public Ticket() {}

    public Ticket(int customerId, int eventId) {
        this.customerId = customerId;
        this.eventId = eventId;
    }

    public Ticket(int ticketNumber, int customerId, int eventId) {
        this(customerId, eventId);
        this.ticketNumber = ticketNumber;
    }

    public int getTicketNumber() {
        return ticketNumber;
    }

    public void setTicketNumber(int ticketNumber) {
        this.ticketNumber = ticketNumber;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getEventId() {
        return eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }

    public String  getCustomerName(){
        Customer customer = TicketDAO.getCustomer(this);
        return customer.getFirstname()+" "+customer.getLastname();
    }

    public String getEventName() {
        Event event = TicketDAO.eventBooked(this);
        return event.getEventname();
    }
}
