package dao;

import database.DB;
import models.Customer;
import models.Event;
import services.DateService;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EventDAO {
    public static void add(Event event) {
        String sql = "INSERT INTO event(eventname,eventtype,description,eventlocation, duration, eventdate, eventhost,evententryfee) VALUES(";
        sql+= "'"+event.getEventname()+"',";
        sql+= "'"+event.getEventtype()+"',";
        sql+="'"+event.getDescription()+"',";
        sql+= "'"+event.getEventlocation()+"',";
        sql+= "'"+event.getDuration()+"',";
        sql+= "'"+event.getEventdate()+"',";
        sql+= "'"+event.getEventhost()+"',";
        sql+= "'"+event.getEvententryfee()+"')";
        DB.executeUpdate(sql);
    }

    public static List<Event> createList(ResultSet resultSet) {
        List<Event> events = new ArrayList<>();
        try {
            while (resultSet.next()) {
                events.add( new Event(
                        resultSet.getInt("id"),
                        resultSet.getInt("eventhost"),
                        resultSet.getInt("duration"),
                        resultSet.getString("eventname"),
                        resultSet.getString("description"),
                        resultSet.getString("eventtype"),
                        resultSet.getString("eventlocation"),
                        resultSet.getString("eventdate"),
                        resultSet.getDouble("evententryfee")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return events;
    }

    public static Event create(ResultSet resultSet) {
        Event event = null;
        try {
            if (resultSet.next()) {
                event = new Event(
                        resultSet.getInt("id"),
                        resultSet.getInt("eventhost"),
                        resultSet.getInt("duration"),
                        resultSet.getString("eventname"),
                        resultSet.getString("description"),
                        resultSet.getString("eventtype"),
                        resultSet.getString("eventlocation"),
                        resultSet.getString("eventdate"),
                        resultSet.getDouble("evententryfee")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return event;
    }

    public static Event get(int id) {
        return create(DB.executeQuery("SELECT * FROM event WHERE id="+id));
    }

    public static List<Event> getUpcoming() {
        return createList(DB.executeQuery("SELECT * FROM event where eventdate > '"+ DateService.today()+"'"));
    }

    public static List<Event> getLive() {
        return createList(DB.executeQuery("SELECT * FROM event where eventdate = '"+ DateService.today()+"'"));
    }

    public static List<Event> getPast() {
        return createList(DB.executeQuery("SELECT * FROM event where eventdate < '"+ DateService.today()+"'"));
    }

    public static void book(int customer, int event) {
        DB.executeUpdate("INSERT INTO eventticket(customerid,eventid) VALUES("+customer+","+event+")");
    }

    public static List<Customer> bookings(int id) {
        String sql = "SELECT c.* FROM customer c INNER JOIN eventticket t ON t.customerid= c.id WHERE t.eventid="+id;
        return CustomerDAO.createList(DB.executeQuery(sql));
    }

    public static List<Event> findByHost(int hostId) {
        String sql = "SELECT * FROM event WHERE eventhost = "+hostId;
        return  createList(DB.executeQuery(sql));
    }


    public static List<Event> getCustomerBookings(int customerId) {
        String sql = "SELECT e.* FROM event e INNER JOIN eventticket t ON e.id = t. WHERE t.customerid = "+customerId;
        return  createList(DB.executeQuery(sql));
    }

    public static List<Event> all() {
        return createList(DB.executeQuery("select * from event order by eventdate desc"));
    }


}
