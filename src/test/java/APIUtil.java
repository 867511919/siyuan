import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import server.AliBaBa;

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
    public static void getJson(String urlStr) throws IOException {

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
        System.out.println(jsonStr);
        JsonObject reData=new JsonParser().parse(jsonStr).getAsJsonObject();
        System.out.println(reData.get("RequestId").getAsString());

//
//        System.out.println(gson.toJson(document.toString()));
    }

    public static void main(String[] args) {
        AliBaBa ab=new AliBaBa();
        try {
            String url=ab.GetMovinfo("29afc97965334befad9c462158019b08");
//            System.out.print(url);
            getJson(url);
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
