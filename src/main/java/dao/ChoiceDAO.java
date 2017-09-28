package dao;

import db.DBUtil;
import entity.ChoiceQuestion;

import java.net.DatagramPacket;
import java.sql.*;
import java.util.ArrayList;

/**
 * Created by null on 2017/8/28.
 */
public class ChoiceDAO {

    public void deleteQuestion(int id){
        Connection conn=DBUtil.getConnection();
        String sql="delete from choicequestion where id= ?";
        try {
            PreparedStatement ptmt=conn.prepareStatement(sql);
            ptmt.setInt(1,id);
            ptmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateQuestionByid(ChoiceQuestion cq,int id){
        Connection conn=DBUtil.getConnection();
        String sql="update choicequestion set title=?,rank=?,body=?,A=?,B=?,C=?,D=?,ex=?,std=? WHERE Id=?";
        try {
            PreparedStatement ptmt=conn.prepareStatement(sql);
            ptmt.setString(1,cq.getTitle());
            ptmt.setString(2,cq.getRank());
            ptmt.setString(3,cq.getBody());
            ptmt.setString(4,cq.getDetailA());
            ptmt.setString(5,cq.getDetailB());
            ptmt.setString(6,cq.getDetailC());
            ptmt.setString(7,cq.getDetailD());
            ptmt.setString(8,cq.getExplain());
            ptmt.setString(9,cq.getStd());
            ptmt.setInt(10,id);
            ptmt.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public ChoiceQuestion showById(int id){
        Connection conn=DBUtil.getConnection();
        String sql="select * from choicequestion where ID=?";
        ChoiceQuestion cq=new ChoiceQuestion();
        try {
            PreparedStatement ptmt=conn.prepareStatement(sql);
            ptmt.setInt(1,id);
            ResultSet rs=ptmt.executeQuery();
            while (rs.next()){
                cq.setId(rs.getInt("ID"));
                cq.setTitle(rs.getString("title"));
                cq.setBody(rs.getString("body"));
                cq.setRank(rs.getString("rank"));
                cq.setDetailA(rs.getString("A"));
                cq.setDetailB(rs.getString("B"));
                cq.setDetailC(rs.getString("C"));
                cq.setDetailD(rs.getString("D"));
                cq.setExplain(rs.getString("ex"));
                cq.setStd(rs.getString("std"));
            }
            return cq;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cq;
    }

    public void addChoice(ChoiceQuestion cq){

        try {
            Connection conn= DBUtil.getConnection();
            String sql="insert into choicequestion (title,rank,body,A,B,C,D,ex,std) values (?,?,?,?,?,?,?,?,?)";
            PreparedStatement ptmt=conn.prepareStatement(sql);
            ptmt.setString(1,cq.getTitle());
            ptmt.setString(2,cq.getRank());
            ptmt.setString(3,cq.getBody());
            ptmt.setString(4,cq.getDetailA());
            ptmt.setString(5,cq.getDetailB());
            ptmt.setString(6,cq.getDetailC());
            ptmt.setString(7,cq.getDetailD());
            ptmt.setString(8,cq.getExplain());
            ptmt.setString(9,cq.getStd());
            ptmt.execute();


        } catch (SQLException e) {
            e.printStackTrace();
        }
    }



    public ArrayList<ChoiceQuestion> getAllQuestion(){
        ArrayList<ChoiceQuestion> list = new ArrayList<ChoiceQuestion>(); // 商品集合
        ResultSet rs=null;
        Statement stmt=null;
        try {
            Connection conn= DBUtil.getConnection();
            stmt=conn.createStatement();
            rs=stmt.executeQuery("SELECT * FROM ChoiceQuestion;");
            while (rs.next()){
                ChoiceQuestion cq=new ChoiceQuestion();
                cq.setId(rs.getInt("ID"));
                cq.setTitle(rs.getString("title"));
                cq.setBody(rs.getString("body"));
                cq.setRank(rs.getString("rank"));
                cq.setDetailA(rs.getString("A"));
                cq.setDetailB(rs.getString("B"));
                cq.setDetailC(rs.getString("C"));
                cq.setDetailD(rs.getString("D"));
                cq.setExplain(rs.getString("ex"));
                cq.setStd(rs.getString("std"));
                list.add(cq);
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

    public static void main(String[] args) {
        ChoiceDAO cd=new ChoiceDAO();
        ChoiceQuestion i=cd.showById(7);
        System.out.println(i);
    }
}
