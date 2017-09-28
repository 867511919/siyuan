import javax.crypto.Mac;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;


import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.*;
import org.apache.commons.codec.binary.Base64;

import static com.aliyuncs.auth.AcsURLEncoder.percentEncode;
import static javax.xml.crypto.dsig.SignatureMethod.HMAC_SHA1;


/**
 * Created by zhangyan on 2017/9/28.
 */
public class GetMovInfo {
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
    public static void main(String[] args) throws UnsupportedEncodingException, NoSuchAlgorithmException, InvalidKeyException {
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
        parameterMap.put("VideoId", "417dddf682554729b22d982ef4da7ab7");
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
        signature = URLEncoder.encode(new String(new Base64().encode(mac.doFinal(stringToSign.toString().getBytes(ENCODE_TYPE))),
                ENCODE_TYPE), ENCODE_TYPE);
        // 生成请求URL
        StringBuilder requestURL;
        requestURL = new StringBuilder("http://vod.cn-shanghai.aliyuncs.com?");
        requestURL.append(URLEncoder.encode("Signature", ENCODE_TYPE)).append("=").append(signature);
        for (Map.Entry<String, String> e : parameterMap.entrySet()) {
            requestURL.append("&").append(percentEncode(e.getKey())).append("=").append(percentEncode(e.getValue()));
        }
        System.out.print(requestURL.toString());

    }
    }

