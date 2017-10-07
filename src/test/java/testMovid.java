import dao.CourseDao;
import entity.course;

import java.util.ArrayList;

/**
 * Created by zhangyan on 2017/9/30.
 */
public class testMovid {
    public static void main(String[] args) {
        CourseDao courseDao=new CourseDao();
        ArrayList<course> list=courseDao.GetAllCourse();
        if(list!=null&&list.size()>0) {
            for (int i = 0; i < list.size(); i++) {
                course cr = list.get(i);
                System.out.println(cr.getTitle());


            }
        }
    }
}
