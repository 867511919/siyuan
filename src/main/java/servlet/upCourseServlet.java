package servlet;

import dao.CourseDao;
import server.UPloadUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

/**
 * Created by zhangyan on 2017/10/6.
 */
@WebServlet(name = "upCourseServlet")
public class upCourseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String movId=request.getParameter("movId");
        CourseDao cd=new CourseDao();
        cd.saveCourse(movId);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title=request.getParameter("title");
        String desc=request.getParameter("desc");
        UPloadUtil uPloadUtil=new UPloadUtil();
        HashMap<String, String> map = new HashMap<String,String>();
        map=uPloadUtil.getAddress_Auth(title,desc);
        request.setAttribute("tit",title);
        request.setAttribute("des",desc);
        request.setAttribute("remap",map);
        request.getRequestDispatcher("../upCourse2.jsp").forward(request,response);
    }
}
