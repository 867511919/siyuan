package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by null on 2017/9/4.
 */
public class DBUtil {
    public static final String URL="jdbc:mysql://127.0.0.1:3306/test_mysql";
    public static final String USER="root";
    public static final String PASSWORD="zhangyan";
    private static Connection conn=null;
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn= DriverManager.getConnection(URL,USER,PASSWORD);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static Connection getConnection(){
        return conn;
    }
}
