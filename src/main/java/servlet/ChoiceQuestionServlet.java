package servlet;

import dao.ChoiceDAO;
import entity.ChoiceQuestion;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by null on 2017/8/28.
 */
@WebServlet(name = "ChoiceQuestionServlet")
public class ChoiceQuestionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(request.getParameter("qid"));
        if(request.getParameter("qid")!=null) {
            int pid = Integer.parseInt(request.getParameter("qid"));
            ChoiceDAO cd = new ChoiceDAO();
            cd.deleteQuestion(pid);
            request.getRequestDispatcher("../index.jsp").forward(request,response);
        }
        System.out.println(request.getParameter("scanid"));
        if(request.getParameter("scanid")!=null){
            int scanid= Integer.parseInt(request.getParameter("scanid"));
            ChoiceDAO cd=new ChoiceDAO();
            ChoiceQuestion cq=cd.showById(scanid);
            request.setAttribute("question",cq);

            request.getRequestDispatcher("../shortview.jsp").forward(request,response);

//            response.sendRedirect("../shortview.jsp");
        }
        System.out.println();request.getParameter("updateid");
        if(request.getParameter("updateid")!=null){
            int scanid= Integer.parseInt(request.getParameter("updateid"));
            ChoiceDAO cd=new ChoiceDAO();
            ChoiceQuestion cq=cd.showById(scanid);
            request.setAttribute("question",cq);
            request.getRequestDispatcher("../update.jsp").forward(request,response);
        }

    }
}
