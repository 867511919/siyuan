package servlet;

import dao.UsersDAO;
import entity.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by null on 2017/8/29.
 */
@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Users u=new Users();
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        u.setUsername(username);
        u.setPassword(password);
        UsersDAO usersDAO=new UsersDAO();
        boolean LoginFlag= usersDAO.judgeUser(u);
        if(LoginFlag){
            //getContextPath()获取本地路径
//            response.sendRedirect("../index.jsp");
            request.setAttribute("username",username);
            request.getRequestDispatcher("../index.jsp").forward(request,response);

        }else{
            //请求重定向
            response.sendRedirect("../login_fi.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
