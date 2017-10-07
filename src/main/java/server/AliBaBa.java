package server;

import com.aliyun.vod.upload.impl.UploadVideoImpl;
import com.aliyun.vod.upload.req.UploadVideoRequest;
import com.aliyun.vod.upload.resp.UploadVideoResponse;
import entity.course;
import org.apache.commons.codec.binary.*;

import javax.crypto.Mac;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.*;

import static javax.xml.crypto.dsig.SignatureMethod.HMAC_SHA1;

/**
 * Created by zhangyan on 2017/9/25.
 */
public class AliBaBa {
    /*
        上传视频到阿里云，返回的是阿里云的videoId

     */

    public String upToaliyun(course cs,String fileName){
        String endpoint = "http://oss-cn-shanghai.aliyuncs.com";
        String accessKeyId = "LTAIXASvvpSofGG7";         //帐号AK
        String accessKeySecret = "0SWfkYqzxGDu5wqPqHeY9r7pXcaslR"; //帐号AK
//        String fileName = "/Users/zhangyan/Downloads/2017-06-28的副本.mp4";      //指定上传文件绝对路径(文件名称必须包含扩展名)
        String title = cs.getTitle();                  //视频标题
        String movId = null;
        UploadVideoRequest request = new UploadVideoRequest(accessKeyId, accessKeySecret, title, fileName);
        request.setCateId(0);                                         //视频分类ID
        request.setTags("标签1,标签2");                               //视频标签,多个用逗号分隔
        request.setDescription("视频描述");                           //视频描述
//        request.setCoverURL("http://cover.sample.com/sample.jpg");    //视频自定义封面URL
//        request.setCallback("http://callback.sample.com");            //设置上传完成后的回调URL
        request.setPartSize(10 * 1024 * 1024L);     //可指定分片上传时每个分片的大小，默认为10M字节
        request.setTaskNum(1);                      //可指定分片上传时的并发线程数，默认为1，(注：该配置会占用服务器CPU资源，需根据服务器情况指定）
        request.setIsShowWaterMark(true);           //是否使用水印

        try {
            UploadVideoImpl uploader = new UploadVideoImpl();
            UploadVideoResponse response = uploader.uploadVideo(request);
            movId=response.getVideoId();
            System.out.print(response.getVideoId()); //上传成功后返回视频ID
        } catch (Exception e) {
            e.printStackTrace();
            System.out.print(e.getCause());
            System.out.print(e.getMessage());

        }
        return movId;
    }

    /*
    查看视频信息，返回的是api请求
     */
    public String GetMovinfo(String s) throws UnsupportedEncodingException, NoSuchAlgorithmException, InvalidKeyException {
        final String HTTP_METHOD = "GET";
        Map<String, String> parameterMap = new HashMap<String, String>();
        // 加入请求公共参数
        parameterMap.put("Action", "GetVideoInfo");
        parameterMap.put("Version", "2017-03-21");
        parameterMap.put("AccessKeyId", "LTAIXASvvpSofGG7"); //此处请替换成您自己的AccessKeyId
//        parameterMap.put("Timestamp", "2017-03-29T12:09:11Z");//此处将时间戳固定只是测试需要，这样此示例中生成的签名值就不会变，方便您对比验证，可变时间戳的生成需要用下边这句替换
        parameterMap.put("Timestamp", formatIso8601Date(new Date()));
        parameterMap.put("SignatureMethod", "HMAC-SHA1");
        parameterMap.put("SignatureVersion", "1.0");
//        parameterMap.put("SignatureNonce", "578a50c1-280d-4a34-bffc-e06aa6b2df76");//此处将唯一随机数固定只是测试需要，这样此示例中生成的签名值就不会变，方便您对比验证，可变唯一随机数的生成需要用下边这句替换
        parameterMap.put("SignatureNonce", UUID.randomUUID().toString());
        parameterMap.put("Format", "JSON");
//        parameterMap.put("Title","aaa");
        // 加入方法特有参数
        parameterMap.put("VideoId", s);
        // 对参数进行排序
        List<String> sortedKeys = new ArrayList<String>(parameterMap.keySet());
        Collections.sort(sortedKeys);
        // 生成stringToSign字符
        final String SEPARATOR = "&";
        final String EQUAL = "=";
        StringBuilder stringToSign = new StringBuilder();
        stringToSign.append(HTTP_METHOD).append(SEPARATOR);
        stringToSign.append(percentEncode("/")).append(SEPARATOR);
        StringBuilder canonicalizedQueryString = new StringBuilder();
//        System.out.print(stringToSign.toString());
        for (String key : sortedKeys) {
            // 此处需要对key和value进行编码0SWfkYqzxGDu5wqPqHeY9r7pXcaslR
            String value = parameterMap.get(key);
            canonicalizedQueryString.append(SEPARATOR).append(percentEncode(key)).append(EQUAL).append(percentEncode(value));
        }
        // 此处需要对canonicalizedQueryString进行编码
        stringToSign.append(percentEncode(canonicalizedQueryString.toString().substring(1)));
        final String ALGORITHM = "HmacSHA1";
        final String secret = "0SWfkYqzxGDu5wqPqHeY9r7pXcaslR";//此处请替换成您的AccessKeySecret
        SecretKey key = new SecretKeySpec((secret + SEPARATOR).getBytes(ENCODE_TYPE),HMAC_SHA1);
        Mac mac = Mac.getInstance(ALGORITHM);
        mac.init(key);
        String signature;
        signature = URLEncoder.encode(new String(new org.apache.commons.codec.binary.Base64().encode(mac.doFinal(stringToSign.toString().getBytes(ENCODE_TYPE))),
                ENCODE_TYPE), ENCODE_TYPE);
        // 生成请求URL
        StringBuilder requestURL;
        requestURL = new StringBuilder("http://vod.cn-shanghai.aliyuncs.com?");
        requestURL.append(URLEncoder.encode("Signature", ENCODE_TYPE)).append("=").append(signature);
        for (Map.Entry<String, String> e : parameterMap.entrySet()) {
            requestURL.append("&").append(percentEncode(e.getKey())).append("=").append(percentEncode(e.getValue()));
        }
//        System.out.print(requestURL.toString());
        return requestURL.toString();
    }
    /*
    删除视频
    返回的是api接口

     */
    public String DeleteVideo(String VideoId) throws UnsupportedEncodingException, NoSuchAlgorithmException, InvalidKeyException {
        final String HTTP_METHOD = "GET";
        Map<String, String> parameterMap = new HashMap<String, String>();
        // 加入请求公共参数
        parameterMap.put("Action", "DeleteVideo");
        parameterMap.put("Version", "2017-03-21");
        parameterMap.put("AccessKeyId", "LTAIXASvvpSofGG7"); //此处请替换成您自己的AccessKeyId
//        parameterMap.put("Timestamp", "2017-03-29T12:09:11Z");//此处将时间戳固定只是测试需要，这样此示例中生成的签名值就不会变，方便您对比验证，可变时间戳的生成需要用下边这句替换
        parameterMap.put("Timestamp", formatIso8601Date(new Date()));
        parameterMap.put("SignatureMethod", "HMAC-SHA1");
        parameterMap.put("SignatureVersion", "1.0");
//        parameterMap.put("SignatureNonce", "578a50c1-280d-4a34-bffc-e06aa6b2df76");//此处将唯一随机数固定只是测试需要，这样此示例中生成的签名值就不会变，方便您对比验证，可变唯一随机数的生成需要用下边这句替换
        parameterMap.put("SignatureNonce", UUID.randomUUID().toString());
        parameterMap.put("Format", "JSON");
//        parameterMap.put("Title","aaa");
        // 加入方法特有参数
        parameterMap.put("VideoIds", VideoId);//"417dddf682554729b22d982ef4da7ab7"
        // 对参数进行排序
        List<String> sortedKeys = new ArrayList<String>(parameterMap.keySet());
        Collections.sort(sortedKeys);
        // 生成stringToSign字符
        final String SEPARATOR = "&";
        final String EQUAL = "=";
        StringBuilder stringToSign = new StringBuilder();
        stringToSign.append(HTTP_METHOD).append(SEPARATOR);
        stringToSign.append(percentEncode("/")).append(SEPARATOR);
        StringBuilder canonicalizedQueryString = new StringBuilder();
//        System.out.print(stringToSign.toString());
        for (String key : sortedKeys) {
            // 此处需要对key和value进行编码0SWfkYqzxGDu5wqPqHeY9r7pXcaslR
            String value = parameterMap.get(key);
            canonicalizedQueryString.append(SEPARATOR).append(percentEncode(key)).append(EQUAL).append(percentEncode(value));
        }
        // 此处需要对canonicalizedQueryString进行编码
        stringToSign.append(percentEncode(canonicalizedQueryString.toString().substring(1)));
        final String ALGORITHM = "HmacSHA1";
        final String secret = "0SWfkYqzxGDu5wqPqHeY9r7pXcaslR";//此处请替换成您的AccessKeySecret
        SecretKey key = new SecretKeySpec((secret + SEPARATOR).getBytes(ENCODE_TYPE),HMAC_SHA1);
        Mac mac = Mac.getInstance(ALGORITHM);
        mac.init(key);
        String signature;
        signature = URLEncoder.encode(new String(new org.apache.commons.codec.binary.Base64().encode(mac.doFinal(stringToSign.toString().getBytes(ENCODE_TYPE))),
                ENCODE_TYPE), ENCODE_TYPE);
        // 生成请求URL
        StringBuilder requestURL;
        requestURL = new StringBuilder("http://vod.cn-shanghai.aliyuncs.com?");
        requestURL.append(URLEncoder.encode("Signature", ENCODE_TYPE)).append("=").append(signature);
        for (Map.Entry<String, String> e : parameterMap.entrySet()) {
            requestURL.append("&").append(percentEncode(e.getKey())).append("=").append(percentEncode(e.getValue()));
        }
//        System.out.print(requestURL.toString());
        return requestURL.toString();
    }
    /*
    修改视频信息

     */
    public String UpdateMoviInfo(String movId,String newTitle,String newDes) throws UnsupportedEncodingException, NoSuchAlgorithmException, InvalidKeyException{
        final String HTTP_METHOD = "GET";
        Map<String, String> parameterMap = new HashMap<String, String>();
        // 加入请求公共参数
        parameterMap.put("Action", "UpdateVideoInfo");
        parameterMap.put("Version", "2017-03-21");
        parameterMap.put("AccessKeyId", "LTAIXASvvpSofGG7"); //此处请替换成您自己的AccessKeyId
//        parameterMap.put("Timestamp", "2017-03-29T12:09:11Z");//此处将时间戳固定只是测试需要，这样此示例中生成的签名值就不会变，方便您对比验证，可变时间戳的生成需要用下边这句替换
        parameterMap.put("Timestamp", formatIso8601Date(new Date()));
        parameterMap.put("SignatureMethod", "HMAC-SHA1");
        parameterMap.put("SignatureVersion", "1.0");
//        parameterMap.put("SignatureNonce", "578a50c1-280d-4a34-bffc-e06aa6b2df76");//此处将唯一随机数固定只是测试需要，这样此示例中生成的签名值就不会变，方便您对比验证，可变唯一随机数的生成需要用下边这句替换
        parameterMap.put("SignatureNonce", UUID.randomUUID().toString());
        parameterMap.put("Format", "JSON");
        parameterMap.put("Title",newTitle);
        parameterMap.put("Description",newDes);
        // 加入方法特有参数
        parameterMap.put("VideoId", movId);
        // 对参数进行排序
        List<String> sortedKeys = new ArrayList<String>(parameterMap.keySet());
        Collections.sort(sortedKeys);
        // 生成stringToSign字符
        final String SEPARATOR = "&";
        final String EQUAL = "=";
        StringBuilder stringToSign = new StringBuilder();
        stringToSign.append(HTTP_METHOD).append(SEPARATOR);
        stringToSign.append(percentEncode("/")).append(SEPARATOR);
        StringBuilder canonicalizedQueryString = new StringBuilder();
//        System.out.print(stringToSign.toString());
        for (String key : sortedKeys) {
            // 此处需要对key和value进行编码0SWfkYqzxGDu5wqPqHeY9r7pXcaslR
            String value = parameterMap.get(key);
            canonicalizedQueryString.append(SEPARATOR).append(percentEncode(key)).append(EQUAL).append(percentEncode(value));
        }
        // 此处需要对canonicalizedQueryString进行编码
        stringToSign.append(percentEncode(canonicalizedQueryString.toString().substring(1)));
        final String ALGORITHM = "HmacSHA1";
        final String secret = "0SWfkYqzxGDu5wqPqHeY9r7pXcaslR";//此处请替换成您的AccessKeySecret
        SecretKey key = new SecretKeySpec((secret + SEPARATOR).getBytes(ENCODE_TYPE),HMAC_SHA1);
        Mac mac = Mac.getInstance(ALGORITHM);
        mac.init(key);
        String signature;
        signature = URLEncoder.encode(new String(new org.apache.commons.codec.binary.Base64().encode(mac.doFinal(stringToSign.toString().getBytes(ENCODE_TYPE))),
                ENCODE_TYPE), ENCODE_TYPE);
        // 生成请求URL
        StringBuilder requestURL;
        requestURL = new StringBuilder("http://vod.cn-shanghai.aliyuncs.com?");
        requestURL.append(URLEncoder.encode("Signature", ENCODE_TYPE)).append("=").append(signature);
        for (Map.Entry<String, String> e : parameterMap.entrySet()) {
            requestURL.append("&").append(percentEncode(e.getKey())).append("=").append(percentEncode(e.getValue()));
        }
//        System.out.print(requestURL.toString());
        return requestURL.toString();

    }

    /*
    获取upAddr 和 upAuth无参数版
     */

    public String getUpApi() throws UnsupportedEncodingException, NoSuchAlgorithmException, InvalidKeyException {

        final String HTTP_METHOD = "GET";
        Map<String, String> parameterMap = new HashMap<String, String>();
        // 加入请求公共参数
        parameterMap.put("Action", "CreateUploadVideo");
        parameterMap.put("Version", "2017-03-21");
        parameterMap.put("AccessKeyId", "LTAIXASvvpSofGG7"); //此处请替换成您自己的AccessKeyId
//        parameterMap.put("Timestamp", "2017-03-29T12:09:11Z");//此处将时间戳固定只是测试需要，这样此示例中生成的签名值就不会变，方便您对比验证，可变时间戳的生成需要用下边这句替换
        parameterMap.put("Timestamp", formatIso8601Date(new Date()));
        parameterMap.put("SignatureMethod", "HMAC-SHA1");
        parameterMap.put("SignatureVersion", "1.0");
//        parameterMap.put("SignatureNonce", "578a50c1-280d-4a34-bffc-e06aa6b2df76");//此处将唯一随机数固定只是测试需要，这样此示例中生成的签名值就不会变，方便您对比验证，可变唯一随机数的生成需要用下边这句替换
        parameterMap.put("SignatureNonce", UUID.randomUUID().toString());
        parameterMap.put("Format", "JSON");
        parameterMap.put("Title","testTitle");
        parameterMap.put("Description","testDescription");
        // 加入方法特有参数
        parameterMap.put("FileName", "hahha.mp4");

        // 对参数进行排序
        List<String> sortedKeys = new ArrayList<String>(parameterMap.keySet());
        Collections.sort(sortedKeys);
        // 生成stringToSign字符
        final String SEPARATOR = "&";
        final String EQUAL = "=";
        StringBuilder stringToSign = new StringBuilder();
        stringToSign.append(HTTP_METHOD).append(SEPARATOR);
        stringToSign.append(percentEncode("/")).append(SEPARATOR);
        StringBuilder canonicalizedQueryString = new StringBuilder();
//        System.out.print(stringToSign.toString());
        for (String key : sortedKeys) {
            // 此处需要对key和value进行编码0SWfkYqzxGDu5wqPqHeY9r7pXcaslR
            String value = parameterMap.get(key);
            canonicalizedQueryString.append(SEPARATOR).append(percentEncode(key)).append(EQUAL).append(percentEncode(value));
        }
        // 此处需要对canonicalizedQueryString进行编码
        stringToSign.append(percentEncode(canonicalizedQueryString.toString().substring(1)));
        final String ALGORITHM = "HmacSHA1";
        final String secret = "0SWfkYqzxGDu5wqPqHeY9r7pXcaslR";//此处请替换成您的AccessKeySecret
        SecretKey key = new SecretKeySpec((secret + SEPARATOR).getBytes(ENCODE_TYPE),HMAC_SHA1);
        Mac mac = Mac.getInstance(ALGORITHM);
        mac.init(key);
        String signature;
        signature = URLEncoder.encode(new String(new org.apache.commons.codec.binary.Base64().encode(mac.doFinal(stringToSign.toString().getBytes(ENCODE_TYPE))),
                ENCODE_TYPE), ENCODE_TYPE);
        // 生成请求URL
        StringBuilder requestURL;
        requestURL = new StringBuilder("http://vod.cn-shanghai.aliyuncs.com?");
        requestURL.append(URLEncoder.encode("Signature", ENCODE_TYPE)).append("=").append(signature);
        for (Map.Entry<String, String> e : parameterMap.entrySet()) {
            requestURL.append("&").append(percentEncode(e.getKey())).append("=").append(percentEncode(e.getValue()));
        }
        System.out.print(requestURL.toString());
        return requestURL.toString();

    }


    /*
    Alibaba Util
     */
    private static final String ISO8601_DATE_FORMAT = "yyyy-MM-dd'T'HH:mm:ss'Z'";
    private static String formatIso8601Date(Date date) {
        SimpleDateFormat df = new SimpleDateFormat(ISO8601_DATE_FORMAT);
        df.setTimeZone(new SimpleTimeZone(0, "GMT"));
        return df.format(date);
    }
    private static final String ENCODE_TYPE = "UTF-8";
    private static String percentEncode(String value) throws UnsupportedEncodingException {
        if (value == null) return null;
        return URLEncoder.encode(value, ENCODE_TYPE).replace("+", "%20").replace("*", "%2A").replace("%7E", "~");
    }


    public static void main(String[] args) {
        AliBaBa ud=new AliBaBa();


        try {
            ud.getUpApi();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (InvalidKeyException e) {
            e.printStackTrace();
        }
    }


    private void upToaliyun(String s) {
    }
}
