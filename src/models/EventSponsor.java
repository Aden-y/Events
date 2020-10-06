package models;

import dao.EventDAO;
import dao.SponsorDAO;

public class EventSponsor {
    private int eventId, 	sponsorId;

    public EventSponsor(int eventId, int sponsorId) {
        this.eventId = eventId;
        this.sponsorId = sponsorId;
    }

    public int getEventId() {
        return eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }

    public int getSponsorId() {
        return sponsorId;
    }

    public void setSponsorId(int sponsorId) {
        this.sponsorId = sponsorId;
    }

    public Event getEvent() {
        return EventDAO.get(eventId);
    }

    public Sponsor getSponsor() {
        return SponsorDAO.get(sponsorId);
    }
}
