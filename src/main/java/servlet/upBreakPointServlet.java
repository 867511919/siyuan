package servlet;

import dao.BreakPointDAO;
import entity.BreakPoint;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by zhangyan on 2017/10/9.
 */
@WebServlet(name = "upBreakPointServlet")
public class upBreakPointServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         String movId=request.getParameter("movid");
         String startTime=request.getParameter("time");
         String title1=request.getParameter("title1");
         String body1=request.getParameter("body1");
         String A1=request.getParameter("A1");
        String B1=request.getParameter("B1");
        String C1=request.getParameter("C1");
        String D1=request.getParameter("D1");
        String desc1=request.getParameter("desc1");

         String title2=request.getParameter("title2");
         String body2=request.getParameter("body2");
         String A2=request.getParameter("A2");
         String B2=request.getParameter("B2");
         String C2=request.getParameter("C2");
         String D2=request.getParameter("D1");
         String desc2=request.getParameter("desc2");

         BreakPoint bp=new BreakPoint();
         bp.setMovId(movId);
         bp.setStartTime(startTime);
         bp.setTitle1(title1);
         bp.setBody1(body1);
         bp.setA1(A1);
         bp.setB1(B1);
         bp.setC1(C1);
         bp.setD1(D1);
         bp.setDesc1(desc1);
         bp.setTitle2(title2);
         bp.setBody2(body2);
         bp.setA2(A2);
         bp.setB2(B2);
         bp.setC2(C2);
         bp.setD2(D2);
         bp.setDesc2(desc2);

        BreakPointDAO bpd=new BreakPointDAO();
        bpd.new_addPoint(bp);
        request.setAttribute("movid",movId);
        request.getRequestDispatcher("../upCourse3.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String movid=request.getParameter("movid");
        System.out.println(movid);
        request.setAttribute("movid",movid);
        request.getRequestDispatcher("../upCourse4.jsp").forward(request,response);

    }
}
