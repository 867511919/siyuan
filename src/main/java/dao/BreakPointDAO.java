package dao;

import db.DBUtil;
import entity.BreakPoint;

import java.sql.*;
import java.util.ArrayList;

/**
 * Created by zhangyan on 2017/9/26.
 */
public class BreakPointDAO {
    public void addPoint(BreakPoint bp){

        try {
            Connection conn= DBUtil.getConnection();
            String sql="insert into breakpoint (movID,startTime) values(?,?)";
            PreparedStatement pst=conn.prepareStatement(sql);
            pst.setString(1,bp.getMovId());
            pst.setString(2,bp.getStartTime());
            pst.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public void new_addPoint(BreakPoint bp){

        try {
            Connection conn= DBUtil.getConnection();
            String sql="insert into breakpoint (movID,startTime,title1,body1,A1,B1,C1,D1,desc1,title2,body2,A2,B2,C2,D2,desc2) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pst=conn.prepareStatement(sql);
            pst.setString(1,bp.getMovId());
            pst.setString(2,bp.getStartTime());
            pst.setString(3,bp.getTitle1());
            pst.setString(4,bp.getBody1());
            pst.setString(5,bp.getA1());
            pst.setString(6,bp.getB1());
            pst.setString(7,bp.getC1());
            pst.setString(8,bp.getD1());
            pst.setString(9,bp.getDesc1());

            pst.setString(10,bp.getTitle1());
            pst.setString(11,bp.getBody2());
            pst.setString(12,bp.getA2());
            pst.setString(13,bp.getB2());
            pst.setString(14,bp.getC2());
            pst.setString(15,bp.getD2());
            pst.setString(16,bp.getDesc2());
            pst.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public ArrayList<BreakPoint> getAllBreakPoint(){
        ArrayList<BreakPoint> list=new ArrayList<BreakPoint>();
        ResultSet rs=null;
        Statement stmt=null;
        try {
            Connection cnn=DBUtil.getConnection();
            stmt=cnn.createStatement();
            rs=stmt.executeQuery("SELECT * FROM breakpoint where movID = '29afc97965334befad9c462158019b08'");
            while (rs.next()){
                BreakPoint bp=new BreakPoint();
                bp.setMovId(rs.getString("movID"));
                bp.setStartTime(rs.getString("startTime"));
                list.add(bp);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
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

    }

    public ArrayList<BreakPoint> queryByMovid(String movId){
        Connection conn=DBUtil.getConnection();
        ResultSet rs=null;
        ArrayList<BreakPoint> list=new ArrayList<BreakPoint>();
        PreparedStatement pstm=null;
        String sql="SELECT * FROM breakpoint where movID = ?";
        try {
//            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm=conn.prepareStatement(sql);
            pstm.setString(1,movId);
            rs=pstm.executeQuery();
            while (rs.next()){
                BreakPoint bp=new BreakPoint();
                bp.setMovId(rs.getString("movID"));
                bp.setStartTime(rs.getString("startTime"));
                list.add(bp);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }

    }



    public static void main(String[] args) {
//        BreakPoint bp=new BreakPoint();
//        bp.setMovId(1);
//        bp.setStartTime("1");
//        bp.setQuestionID(1);
        BreakPointDAO bpd=new BreakPointDAO();
//        bpd.addPoint(bp);
//        for(BreakPoint i :bpd.getAllBreakPoint()){
//            System.out.println(i.getMovId());
//        }
        for(BreakPoint i: bpd.queryByMovid("30e9a00852da421782a4bc48c8ab6825")){
            System.out.println(i.getStartTime());
        }
    }

}
