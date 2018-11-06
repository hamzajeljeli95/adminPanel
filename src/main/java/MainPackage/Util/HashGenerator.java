package MainPackage.Util;

import java.security.MessageDigest;

public class HashGenerator {
    public static String getStringHash(String str){
        try{
            MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
            messageDigest.update(str.getBytes());
            return new String(messageDigest.digest());
        }
        catch (Exception e){
            e.printStackTrace();
            return str;
        }
    }
}
