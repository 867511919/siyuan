import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import java.io.FileNotFoundException;
import java.io.FileReader;

/**
 * Created by zhangyan on 2017/9/29.
 */
public class GsonDemo {
    public static void jeixi(){
        JsonParser parse =new JsonParser();
        try {
            JsonObject json=(JsonObject) parse.parse(new FileReader("src/test/resources/test.json"));  //创建jsonObject对象
            System.out.println("RequestID"+json.get("RequestId").getAsString());
            JsonObject video= (JsonObject) json.get("Video");
            System.out.println(video.get("VideoId").getAsString());

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        jeixi();
    }
}
