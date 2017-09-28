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
 * Created by null on 2017/9/1.
 */
@WebServlet(name = "upServlet")
public class upServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("in post");
        ChoiceQuestion cq=new ChoiceQuestion();
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
        cd.addChoice(cq);
        request.getRequestDispatcher("../index.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
