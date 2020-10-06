package dao;

import database.DB;
import models.Event;
import models.EventSponsor;
import models.Sponsor;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EventSponsorDAO {
    public static EventSponsor create(ResultSet resultSet) {
        try {
            if (resultSet.next()) {
                return new EventSponsor(resultSet.getInt("eventid"), resultSet.getInt("sponsorid"));
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return  null;
    }

    public static List<EventSponsor> createList(ResultSet resultSet) {
        List<EventSponsor> sponsors = new ArrayList<>();
        try {
            while (resultSet.next()) {
                sponsors.add(new EventSponsor(resultSet.getInt("eventid"), resultSet.getInt("sponsorid")));
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return  sponsors;
    }

    public static List<EventSponsor> getEventSponsors(Event event) {
        return createList(DB.executeQuery("select * from eventsponsor where eventid = "+event.getId()));
    }

    public static List<EventSponsor> getSponsorsEvent(Sponsor sponsor) {
        return createList(DB.executeQuery("select * from eventsponsor where sponsorid = "+sponsor.getId()));
    }

    public static void add(EventSponsor sponsor) {
        String sql = "insert into eventsponsor values("+sponsor.getEventId()+","+sponsor.getSponsorId()+")";
        DB.executeUpdate(sql);
    }
}
