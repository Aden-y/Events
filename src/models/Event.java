package models;

import dao.HostDAO;

public class Event {
    private int id, eventhost, duration;
    private String eventname, description, eventtype, eventlocation, eventdate;
    double evententryfee;

    public Event(int id ,int eventhost,
                 int duration,
                 String eventname,
                 String description,
                 String eventtype,
                 String eventlocation,
                 String eventdate,
                 double evententryfee) {
        this.id = id;
        this.description = description;
        this.eventhost = eventhost;
        this.duration = duration;
        this.eventname = eventname;
        this.eventtype = eventtype;
        this.eventlocation = eventlocation;
        this.eventdate = eventdate;
        this.evententryfee = evententryfee;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getEventhost() {
        return eventhost;
    }

    public void setEventhost(int eventhost) {
        this.eventhost = eventhost;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public String getEventname() {
        return eventname;
    }

    public void setEventname(String eventname) {
        this.eventname = eventname;
    }

    public String getEventtype() {
        return eventtype;
    }

    public void setEventtype(String eventtype) {
        this.eventtype = eventtype;
    }

    public String getEventlocation() {
        return eventlocation;
    }

    public void setEventlocation(String eventlocation) {
        this.eventlocation = eventlocation;
    }

    public String getEventdate() {
        return eventdate;
    }

    public void setEventdate(String eventdate) {
        this.eventdate = eventdate;
    }

    public double getEvententryfee() {
        return evententryfee;
    }

    public void setEvententryfee(double evententryfee) {
        this.evententryfee = evententryfee;
    }

    public String getHostName(){
        return HostDAO.get(eventhost).getHostname();
    }
}
