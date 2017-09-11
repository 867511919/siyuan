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
 * Created by null on 2017/9/4.
 */
@WebServlet(name = "updateServlet")
public class updateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("go post");
        ChoiceQuestion cq=new ChoiceQuestion();
        int id= Integer.parseInt(request.getParameter("id"));
        String title=request.getParameter("title");
        String rank=request.getParameter("rank");
        String boby=request.getParameter("body");
        String A=request.getParameter("A");
        String B=request.getParameter("B");
        String C=request.getParameter("C");
        String D=request.getParameter("D");
        String explain=request.getParameter("explain");
        String std=request.getParameter("std");

        cq.setTitle(title);
        cq.setRank(rank);
        cq.setBody(boby);
        cq.setDetailA(A);
        cq.setDetailB(B);
        cq.setDetailC(C);
        cq.setDetailD(D);
        cq.setExplain(explain);
        cq.setStd(std);

        ChoiceDAO cd=new ChoiceDAO();
        cd.updateQuestionByid(cq,id);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);

    }
}
