package servlet;

import com.aliyun.vod.upload.impl.UploadVideoImpl;
import com.aliyun.vod.upload.req.UploadVideoRequest;
import com.aliyun.vod.upload.resp.UploadVideoResponse;
import dao.BreakPointDAO;
import dao.CourseDao;
import entity.BreakPoint;
import entity.course;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import server.AliBaBa;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/**
 * Created by zhangyan on 2017/9/25.
 */
@WebServlet(name = "CourseServlet")
public class CourseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//       System.out.println("hah");
//       course cs=new course();
//       String title=request.getParameter("title");
//       String price=request.getParameter("price");
//       String description=request.getParameter("description");
//
//       cs.setTitle(title);
//       cs.setPrice(price);
//       cs.setDescription(description);
//       System.out.print(title);
//       System.out.print(price);
////        String fileName = "/Users/zhangyan/Downloads/2017-06-28的副本.mp4";
//        String fileName=request.getParameter("filepath");
//        System.out.println(fileName);
//        AliBaBa ab=new AliBaBa();
//
//        String Movid=ab.upToaliyun(cs,fileName);
//        cs.setMovid(Movid);
//        CourseDao cd=new CourseDao();
//        cd.saveCourse(cs);
//
//        int bMovid=cd.QueryByMovId(Movid);
//        String btartTime=request.getParameter("startTime");
//        BreakPoint bp=new BreakPoint();
//        bp.setMovId(bMovid);
//        bp.setStartTime(btartTime);
//
//        BreakPointDAO bpd=new BreakPointDAO();
//        bpd.addPoint(bp);
//
////
        String message = "";
        try {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setHeaderEncoding("UTF-8");
            //判断提交上来的数据是否是上传表单的数据
            if (!ServletFileUpload.isMultipartContent(request)) {
                //按照传统方式获取数据
                return;
            }
            //使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
            List<FileItem> list = upload.parseRequest(request);
            for (FileItem item : list) {
                //如果fileitem中封装的是普通输入项的数据
                if (item.isFormField()) {
                    String name = item.getFieldName();
                    //解决普通输入项的数据的中文乱码问题
                    String value = item.getString("UTF-8");
                    System.out.println(name + "=" + value);
                } else {//如果fileitem中封装的是上传文件
                    //得到上传的文件名称，
                    String filename = item.getName();
                    System.out.println(filename);
                    if (filename == null || filename.trim().equals("")) {
                        continue;
                    }
                    item.delete();
//                    String fileName = "/Users/zhangyan/Downloads/2017-06-28的副本.mp4";
//                    AliBaBa ab=new AliBaBa();
//                    ab.upToaliyun(cs,fileName);
                    message = "文件上传成功！";
                }

            }
        } catch (Exception e) {
            message = "文件上传失败！";
            e.printStackTrace();
        }

    }





    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
