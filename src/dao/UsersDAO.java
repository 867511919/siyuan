package dao;

import entity.Users;

import java.sql.*;

/**
 * Created by null on 2017/8/29.
 */
public class UsersDAO {
    private final String URL="jdbc:mysql://127.0.0.1:3306/test_mysql";
    private final String NAME="root";
    private final String PASSWORD="zhangyan";
    boolean getPermit = false;
    public boolean judgeUser(Users u){
        String username=u.getUsername();
        String password=u.getPassword();
        PreparedStatement stmt=null;
        ResultSet rs=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn= DriverManager.getConnection(URL,NAME,PASSWORD);
            stmt=conn.prepareStatement("select * from userinfo where username=?");
            stmt.setString(1,username);
            rs= stmt.executeQuery();

            if(rs.next())
            {
                if (rs.getString(2).equals(password))
                {
                    getPermit = true;
                }
            }
            return getPermit;

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
            return getPermit;
        }finally {
            if(rs!=null){
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if(stmt!=null){
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return getPermit;
    }

}
