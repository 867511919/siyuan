package servlet;

import server.APIUtil;
import server.AliBaBa;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

/**
 * Created by zhangyan on 2017/9/30.
 */
@WebServlet(name = "MaCourseServlet")
public class MaCourseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(request.getParameter("movid"));
        AliBaBa aliBaBa = new AliBaBa();
        APIUtil apiUtil=new APIUtil();
        if(request.getParameter("movid")!=null) {
            String movId = request.getParameter("movid");
            String newTitle=request.getParameter("title");
            String newDesc=request.getParameter("desc");
            System.out.println(movId+" "+newTitle+" "+newDesc);
            try {
                String apiurl=aliBaBa.UpdateMoviInfo(movId,newTitle,newDesc);
                apiUtil.getRequest(apiurl);
            } catch (NoSuchAlgorithmException e) {
                e.printStackTrace();
            } catch (InvalidKeyException e) {
                e.printStackTrace();
            }
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
