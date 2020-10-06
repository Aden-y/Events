package dao;
import database.DB;
import models.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SponsorshipRequestDAO {
    public static SponsorshipRequest create(ResultSet resultSet) {
      try {
          if(resultSet.next()) {
              return new SponsorshipRequest(
                      resultSet.getInt("id"),
                      resultSet.getInt("eventid"),
                      resultSet.getInt("sponsorid"),
                      resultSet.getString("_by")
              );
          }
      }catch (SQLException e) {
          e.printStackTrace();
      }
        return null;
    }

    public static List<SponsorshipRequest> createList(ResultSet resultSet) {
        List<SponsorshipRequest> requests = new ArrayList<>();
        try {
            while (resultSet.next()) {
                requests.add( new SponsorshipRequest(
                        resultSet.getInt("id"),
                        resultSet.getInt("eventid"),
                        resultSet.getInt("sponsorid"),
                        resultSet.getString("_by")
                ));
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return requests;
    }

    public static void send(SponsorshipRequest request) {
        String sql = "insert into sponsorshiprequest (eventid, sponsorid, _by) values(";
        sql+=request.getEventId()+",";
        sql+=request.getSponsorId()+",";
        sql+="'"+request.getBy()+"')";
        System.out.println(sql);
        DB.executeUpdate(sql);
    }
    public static List<SponsorshipRequest> getSponsorsRequests(Sponsor sponsor) {
        String sql = "select * from sponsorshiprequest where sponsorid = "+sponsor.getId()+" AND _by ='H'";
        return createList(DB.executeQuery(sql));
    }

    public static List<SponsorshipRequest> getEventRequests(Event event) {
        String sql = "select * from sponsorshiprequest where eventid = "+event.getId()+" AND _by ='S'";
        return createList(DB.executeQuery(sql));
    }

    public static void accept(SponsorshipRequest request) {
        EventSponsor sponsor = new EventSponsor(request.getEventId(), request.getSponsorId());
        EventSponsorDAO.add(sponsor);
        deleteRequest(request);
    }

    public static void deleteRequest(SponsorshipRequest request) {
        String sql = "delete from sponsorshiprequest where eventid = "+request.getEventId()+" and sponsorid = "+request.getSponsorId();
        DB.executeUpdate(sql);
    }

    public static void reject(SponsorshipRequest request) {
        deleteRequest(request);
    }

    public static List<SponsorshipRequest> getRequestsToHost(Host host) {
        String sql ="select sponsorshiprequest.* from sponsorshiprequest inner join event on sponsorshiprequest.eventid = event.id where event.eventhost = "+host.getId()+" and sponsorshiprequest._by='S'";
        return createList(DB.executeQuery(sql));
    }
}
