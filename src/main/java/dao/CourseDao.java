package dao;

import db.DBUtil;
import entity.course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by zhangyan on 2017/9/26.
 */
public class CourseDao {

    public void saveCourse(course cs){

        try {
            Connection conn=DBUtil.getConnection();
            String sql="insert into test_course (title,description,price,coureseID) values (?,?,?,?)";
            PreparedStatement pst=conn.prepareStatement(sql);
            pst.setString(1,cs.getTitle());
            pst.setString(2,cs.getDescription());
            pst.setDouble(3, Double.parseDouble(cs.getPrice()));
            pst.setString(4,cs.getMovid());

            pst.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public int QueryByMovId(String movid){
        int re=-1;

        try {
            Connection conn=DBUtil.getConnection();
            String sql="select ID from test_course where coureseID=?";
            PreparedStatement pst=conn.prepareStatement(sql);
            pst.setString(1,movid);
            ResultSet rs=pst.executeQuery();
            if(rs.next()){
                re=rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return re;
    }

    public static void main(String[] args) {
        CourseDao cd=new CourseDao();
        course ss=new course();
//        ss.setTitle("hhhhsda");
//        ss.setDescription("hhh");
//        ss.setPrice("1.2");
//        ss.setMovid("a^hd3@djjd");
//        cd.saveCourse(ss);
        System.out.print(cd.QueryByMovId("206af78f318842a59f70a483e557280a"));
    }
}
