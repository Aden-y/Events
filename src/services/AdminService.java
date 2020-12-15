package services;

public class AdminService {
    private static final String USER = "admin@events.com",  PWD = "kevin98";

    public static boolean authenticate(String user, String password) {
        return user.equals(USER) && password.equals(PWD);
    }
}
