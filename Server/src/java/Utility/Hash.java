/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utility;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author Admins
 */
public class Hash {

    public static String SHA256(String message) {
        try {
            MessageDigest sha256 = MessageDigest.getInstance("SHA-256");

            byte[] hash = sha256.digest(message.getBytes());

            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                String hex = Integer.toHexString(0xFF & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }

            return hexString.toString();
        } catch (NoSuchAlgorithmException ex) {
            System.err.println(ex.getMessage());

            return null;
        }
    }

    public static String encodeURIComponent(String message) {
        try {
            return URLEncoder.encode(message, "UTF-8");
        } catch (UnsupportedEncodingException ex) {
            System.err.println(ex.getMessage());

            return null;
        }
    }

    public static String decodeURIComponent(String message) {
        try {
            return URLDecoder.decode(message, "UTF-8");
        } catch (UnsupportedEncodingException ex) {
            System.err.println(ex.getMessage());

            return null;
        }
    }
}
