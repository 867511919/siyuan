package dao;

import db.DBUtil;
import entity.BreakPoint;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by zhangyan on 2017/9/26.
 */
public class BreakPointDAO {
    public void addPoint(BreakPoint bp){

        try {
            Connection conn= DBUtil.getConnection();
            String sql="insert into breakpoint (movID,startTime,questionID) values(?,?,?)";
            PreparedStatement pst=conn.prepareStatement(sql);
            pst.setInt(1,bp.getMovId());
            pst.setString(2,bp.getStartTime());
            pst.setInt(3, bp.getQuestionID());
            pst.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public static void main(String[] args) {
        BreakPoint bp=new BreakPoint();
        bp.setMovId(1);
        bp.setStartTime("1");
        bp.setQuestionID(1);
        BreakPointDAO bpd=new BreakPointDAO();
        bpd.addPoint(bp);
    }

}
