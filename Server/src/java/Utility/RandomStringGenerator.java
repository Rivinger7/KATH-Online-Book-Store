/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utility;

import java.math.BigInteger;
import java.security.SecureRandom;

/**
 *
 * @author Admins
 */
public class RandomStringGenerator {
    private static SecureRandom random = new SecureRandom();

    public static String generateRandomString(int length) {
        return new BigInteger(130, random).toString(32).substring(0, length);
    }

//    public static void main(String[] args) {
//        // Generate a random string with length 10
//        String randomString = generateRandomString(10);
//        System.out.println("Random String: " + randomString);
//    }
}
