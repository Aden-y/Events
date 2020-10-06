package models;

import dao.EventDAO;
import dao.SponsorDAO;

public class SponsorshipRequest {
    private int id, eventId, sponsorId;
    private String by;

    public SponsorshipRequest(int eventId, int sponsorId) {
        this.eventId = eventId;
        this.sponsorId = sponsorId;
    }

    public SponsorshipRequest(int id, int eventId, int sponsorId, String by) {
        this.id = id;
        this.eventId = eventId;
        this.sponsorId = sponsorId;
        this.by = by;
    }

    public SponsorshipRequest(int eventId, int sponsorId, String by) {
        this.eventId = eventId;
        this.sponsorId = sponsorId;
        this.by = by;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getBy() {
        return by;
    }

    public void setBy(String by) {
        this.by = by;
    }

    public Sponsor getSponsor() {
        return SponsorDAO.get(sponsorId);
    }

    public Event getEvent() {
        return EventDAO.get(eventId);
    }
}
