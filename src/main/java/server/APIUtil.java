package server;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import entity.course;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

/**
 * Created by zhangyan on 2017/9/30.
 */
public class APIUtil {



    /*
    打开api链接
     */
    public void getRequest(String urlStr) throws IOException {
        URL url=new URL(urlStr);
        StringBuffer document=new StringBuffer();
        URLConnection conn=url.openConnection();
        BufferedReader reader=new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));
        String line=null;
        while ((line=reader.readLine())!=null){
            document.append(line);
        }
        reader.close();
        String jsonStr=document.toString();
        System.out.println(document);
    }


    /*
    解析json 返回course类

     */
    public course getJson(String urlStr) throws IOException {

        URL url=new URL(urlStr);
        StringBuffer document=new StringBuffer();
        URLConnection conn=url.openConnection();
        BufferedReader reader=new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));
        String line=null;
        while ((line=reader.readLine())!=null){
            document.append(line);
        }
        reader.close();
        String jsonStr=document.toString();
//        System.out.println(jsonStr);
        JsonObject reData=new JsonParser().parse(jsonStr).getAsJsonObject();
//        System.out.println(reData.get("RequestId").getAsString());
        JsonObject Video= (JsonObject) reData.get("Video");
        String VideoId=Video.get("VideoId").getAsString();
        String ModifyTime=Video.get("ModifyTime").getAsString();
        String Title=Video.get("Title").getAsString();
        String CreateTime=Video.get("CreateTime").getAsString();
        String Size=Video.get("Size").getAsString();
        String desc=Video.get("Description").getAsString();
//        System.out.println(VideoId);
//        System.out.println(ModifyTime);
//        System.out.println(Title);
//        System.out.println(CreateTime);
//        System.out.println(Size);
        System.out.println(desc);

        course cs=new course();
        cs.setMovid(VideoId);
        cs.setTitle(Title);
        cs.setModifyTime(ModifyTime);
        cs.setCreateTime(CreateTime);
        cs.setSize(Size);
        cs.setDescription(desc);

        return cs;
    }

    /*
     获取upAddr 和 upAuth
     */



    public static void main(String[] args) {
        AliBaBa ab=new AliBaBa();
        try {
            String url=ab.GetMovinfo("29afc97965334befad9c462158019b08");
//            System.out.print(url);
//            getJson(url);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (InvalidKeyException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
