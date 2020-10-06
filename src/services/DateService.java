package services;

import java.text.ParseException;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class DateService {
    public static  final String pattern = "yyyy-MM-dd";
    public static String toString(Date date) {
        DateFormat df = new SimpleDateFormat(pattern);
        return  df.format(date);
    }

    public static String today() {
        return toString(new Date());
    }

    public static Date toDate(String dateString) {
        try {
            return new SimpleDateFormat(pattern).parse(dateString);
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }
}
