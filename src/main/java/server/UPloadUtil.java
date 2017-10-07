package server;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.vod.model.v20170321.CreateUploadVideoRequest;
import com.aliyuncs.vod.model.v20170321.CreateUploadVideoResponse;
import com.aliyuncs.vod.model.v20170321.RefreshUploadVideoRequest;
import com.aliyuncs.vod.model.v20170321.RefreshUploadVideoResponse;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.SimpleTimeZone;

/**
 * Created by zhangyan on 2017/10/6.
 */
public class UPloadUtil {
    /*
        帮助上传获取上传的upAdress 和 upAuth

     */
    private static String accessKeyId = "LTAIXASvvpSofGG7";
    private static String accessKeySecret = "0SWfkYqzxGDu5wqPqHeY9r7pXcaslR";

    private static String createUploadVideo(DefaultAcsClient client,HashMap<String,String> map,String title,String desc) {
        CreateUploadVideoRequest request = new CreateUploadVideoRequest();
        CreateUploadVideoResponse response = null;
        try {
              /*必选，视频源文件名称（必须带后缀, 支持 ".3gp", ".asf", ".avi", ".dat", ".dv", ".flv", ".f4v", ".gif", ".m2t", ".m3u8", ".m4v", ".mj2", ".mjpeg", ".mkv", ".mov", ".mp4", ".mpe", ".mpg", ".mpeg", ".mts", ".ogg", ".qt", ".rm", ".rmvb", ".swf", ".ts", ".vob", ".wmv", ".webm"".aac", ".ac3", ".acm", ".amr", ".ape", ".caf", ".flac", ".m4a", ".mp3", ".ra", ".wav", ".wma"）*/
            StringBuffer sb=new StringBuffer();
            sb.append(formatIso8601Date(new Date()));
            sb.append(".mp4");
//            System.out.println(sb.toString());
            request.setFileName(sb.toString());
            //必选，视频标题
            request.setTitle(title);
            //可选，分类ID
            request.setCateId(0);
            //可选，视频标签，多个用逗号分隔
            request.setTags("标签1,标签2");
            //可选，视频描述
            request.setDescription(desc);
            request.setCoverURL("https://gss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/b812c8fcc3cec3fd84e2d8d4df88d43f869427b6.jpg");
            //可选，视频源文件字节数
            request.setFileSize((long) 0);
            response = client.getAcsResponse(request);
        } catch (ServerException e) {
            System.out.println("CreateUploadVideoRequest Server Exception:");
            e.printStackTrace();
        } catch (ClientException e) {
            System.out.println("CreateUploadVideoRequest Client Exception:");
            e.printStackTrace();
        }
//        System.out.println("RequestId:"+response.getRequestId());
        map.put("RequestId",response.getRequestId());
//        System.out.println("UploadAuth:"+response.getUploadAuth());
        map.put("UploadAuth",response.getUploadAuth());
//        System.out.println("UploadAddress:"+response.getUploadAddress());
        map.put("UploadAddress",response.getUploadAddress());
        map.put("VideoId",response.getVideoId());
        return response.getVideoId();
    }
    private static void refreshUploadVideo(DefaultAcsClient client,HashMap<String,String> map) {
        RefreshUploadVideoRequest request = new RefreshUploadVideoRequest();
        RefreshUploadVideoResponse response = null;
        String videoId=map.get("VideoId");
        try {
            request.setVideoId(videoId);
            response = client.getAcsResponse(request);
        } catch (ServerException e) {
            System.out.println("RefreshUploadVideoRequest Server Exception:");
            e.printStackTrace();
        } catch (ClientException e) {
            System.out.println("RefreshUploadVideoRequest Client Exception:");
            e.printStackTrace();
        }
        map.put("RequestId",response.getRequestId());
        map.put("UploadAuth",response.getUploadAuth());
//        System.out.println("RequestId:" + response.getRequestId());
//        System.out.println("UploadAuth:" + response.getUploadAuth());
    }

    public HashMap<String,String> getAddress_Auth(String title,String desc){
        HashMap<String,String> map=new HashMap<String, String>();
        DefaultAcsClient aliyunClient;
        aliyunClient = new DefaultAcsClient(DefaultProfile.getProfile("cn-shanghai",accessKeyId,accessKeySecret));
        String videoId = createUploadVideo(aliyunClient,map,title,desc);
//        System.out.println("VideoId:" + videoId);
//        System.out.println(map.get("UploadAuth"));
        return map;
    }
    public void updateAdress_Auth(HashMap<String,String> map){
        DefaultAcsClient aliyunClient;
        aliyunClient = new DefaultAcsClient(DefaultProfile.getProfile("cn-shanghai",accessKeyId,accessKeySecret));

        refreshUploadVideo(aliyunClient,map);

    }

    private static final String ISO8601_DATE_FORMAT = "yyyy-MM-dd'T'HH:mm:ss'Z'";
    private static String formatIso8601Date(Date date) {
        SimpleDateFormat df = new SimpleDateFormat(ISO8601_DATE_FORMAT);
        df.setTimeZone(new SimpleTimeZone(0, "GMT"));
        return df.format(date);
    }

    public static void main(String[] args) {
//        HashMap<String,String> map=new HashMap<String, String>();
//        UPloadUtil uPloadUtil=new UPloadUtil();
//        map=uPloadUtil.getAddress_Auth();
//        System.out.println(map.get("UploadAuth"));
//        System.out.println(map.get("UploadAddress"));
////        uPloadUtil.updateAdress_Auth(map);
//        System.out.println(map.get("RequestId"));

    }
}
