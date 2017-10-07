package dao;

import db.DBUtil;
import entity.ChoiceQuestion;
import entity.course;
import server.APIUtil;
import server.AliBaBa;

import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;

/**
 * Created by zhangyan on 2017/9/26.
 */
public class CourseDao {

    public void saveCourse(String movId){

        try {
            Connection conn=DBUtil.getConnection();
            String sql="insert into test_course (coureseID) values (?)";
            PreparedStatement pst=conn.prepareStatement(sql);
            pst.setString(1,movId);


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

    public ArrayList<course> GetAllCourse(){
        ArrayList<course> courses=new ArrayList<course>();
        ArrayList<course> tmp=new ArrayList<course>();
        AliBaBa ab=new AliBaBa();
        APIUtil au=new APIUtil();
        ResultSet rs=null;
        Statement stmt=null;
        try {
            Connection conn= DBUtil.getConnection();
            stmt=conn.createStatement();
            rs=stmt.executeQuery("SELECT * FROM test_course");
            while (rs.next()){
                String movId=rs.getString("coureseID");
                String apiUrl=ab.GetMovinfo(movId);
                course cr= au.getJson(apiUrl);
                courses.add(cr);

            }
            return courses;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } catch (IOException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (InvalidKeyException e) {
            e.printStackTrace();
        } finally {
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


        return courses;
    }
    public static void main(String[] args) {

        CourseDao courseDao=new CourseDao();
        ArrayList<course> list=courseDao.GetAllCourse();
        if(list!=null&&list.size()>0) {
            for (int i = 0; i < list.size(); i++) {
                course cr = list.get(i);
                System.out.println(cr.getTitle()+" "+cr.getDescription());

            }
        }
    }
}
