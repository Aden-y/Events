package dao;

import database.DB;
import models.Customer;
import models.Event;
import models.Ticket;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class TicketDAO {
    public static void   book(Ticket ticket) {
        String sql = "insert into  eventticket (customerid, eventid) values(";
        sql+=ticket.getCustomerId()+","+ticket.getEventId()+")";
        DB.executeUpdate(sql);
    }

    public static Ticket create(ResultSet resultSet) {
        Ticket ticket = null;
        try {
            if(resultSet.next()) {
                ticket = new Ticket(
                        resultSet.getInt("ticketnumber"),
                        resultSet.getInt("customerid"),
                        resultSet.getInt("eventid")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  ticket;
    }

    public static List<Ticket> createList(ResultSet resultSet) {
        List<Ticket> list = new ArrayList<Ticket>();
        try {
            while (resultSet.next()) {
                list.add(new Ticket(
                        resultSet.getInt("ticketnumber"),
                        resultSet.getInt("customerid"),
                        resultSet.getInt("eventid")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static Event eventBooked(Ticket ticket) {
        return  EventDAO.get(ticket.getEventId());
    }

    public static Customer getCustomer(Ticket ticket) {
        return CustomerDAO.get(ticket.getCustomerId());
    }

    public static List<Ticket> getEventTickets(Event event) {
        return createList(DB.executeQuery("select * from eventticket where eventid = "+event.getId()));
    }

    public  static  List<Ticket> getCustomerTickets(Customer customer) {
        return createList(DB.executeQuery("select * from eventticket where customerid = "+customer.getId()));
    }
}
