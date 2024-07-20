/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utility;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Scanner;

public class MyTools {

    public static final Scanner sc = new Scanner(System.in);

    /* 
    Parsing the input string to get a boolean data (true/false)
    @param input: input string
    @return true if the first character in input is 'T' or '1' or 'Y'
     */
    public static boolean parseBoolean(String input) {
        input = input.trim().toUpperCase(); // chuẩn hóa chuỗi nhập
        char c = input.charAt(0); // Lấy ký tự của chuỗi nhập
        return c == 'T' || c == '1' || c == 'Y'; // trả về ký tự true nếu hợp lệ
    }

    /*
    Normalizing a date string: Using '-' to separate date parts only
    @param dateStr: input date string
    @return new string
     */
    // "   7 ... --- 2 /// 2003   " -> "7-2-2013" (Example01)
    public static String normalizeDateStr(String dateStr) {
        /* 
        Loại bỏ tất cả khoảng trống trắng trong chuỗi nhập.
        Dùng replaceAll() với regex phù hợp (Example01)
        Rồi return sau khi đã xử lý
         */
        dateStr = dateStr.replaceAll("[\\s]+", "");

        /*
        Thay thế tất cả nhóm ký tự đặc biệt bằng '-'.
        Dùng như cách trên
        ...
         */
        String result = dateStr.replaceAll("[./-]+", "-");
        return result;
    }

    /*
    Parsing the input string to date data
    @param inputStr or dateStr: date string input
    @param dateFormat: chosen date format
    @return Date object if successful and null if failed
     */
    public static Date parseDate(String dateStr, String dateFormat) {
        if(dateStr == null || dateStr.isEmpty()) {
            return null;
        }
        dateStr = normalizeDateStr(dateStr); // chuẩn hóa chuỗi ngày tháng
        DateFormat formatter = new SimpleDateFormat(dateFormat); // Tạo DateFormat
        try { // Dùng formatter parse chuỗi nhập rồi return kết quả
            return formatter.parse(dateStr);
        } catch (ParseException pe) {
            System.err.println(pe);
        }
        return null; // Không phân tích thành công thì return null
    }

    /*
    Convert a Date object to string using a given date format
    @param date: Date object
    @param dateFormat: choosen date format
    @return date string in the given format
     */
    public static String toString(Date dateStr, String dateFormat) {
        if (dateStr == null) {
            return "";
        }
        // Tạo DateFormat object làm việc với định dạng trong tham số thứ hai
        DateFormat formatter = new SimpleDateFormat(dateFormat);
        // Return kết quả sau khi đã format thàn công
        return formatter.format(dateStr);
    }

    /*
    Getting year of date data
    @param d: Date data
    @param calendarPart: date part is declared in the class Calendar
    @return year in date data
     */
    public static int getPart(Date date, int calendarPart) {
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(date);
        return calendar.get(calendarPart);
    }

    // -------------------------------------------- //
    // -- METHODS FOR READING DATA FROM KEYBOARD -- //
    // -------------------------------------------- //

    /*
    Reading a boolean data
    
    Prompt variable means
    a sign on a computer screen that shows
    that the computer is ready to receive your instructions
    Prompt variable can be replaced by another name like Message
     */
    public static boolean readBoolean(String prompt) { // 
        System.out.print(prompt + ": ");
        return parseBoolean(sc.nextLine());
    }

    /*
    Reading a string using a pre-define pattern
    @param prompt: prompt will be printed before inputting
    @param pattern: pre-defined pattern of input
    @return an input string which matches the pattern
     */
    public static String readStr(String prompt, String pattern) {
        String input;
        boolean validInput ;
        do {
            System.out.print(prompt + ": ");
            input = sc.nextLine().trim();
            validInput = input.matches(pattern);
        } while (!validInput);
        return input;
    }
    
    public static String readBlankNumber(String prompt, String pattern) {
        String input;
        boolean validInput;
        do {
            System.out.print(prompt + ": ");
            input = sc.nextLine().trim();
            if(input.isEmpty()) {
                return "-1";
            }
            validInput = input.matches(pattern);
        } while (!validInput);
        return input;
    }

    /*
    Reading a date data using a pre-defined date format
    dd-MM--yyyy / MM-dd-yyyy / yyyy-MM-dd
    @param prompt: prompt will be printed before inputting
    @param pattern: pre-defined pattern of input
    @return an input string which matches the pattern
     */
    public static Date readDate(String prompt, String dateFormat) {
        String input;
        Date date;
        do {
            System.out.println(prompt + ": ");
            input = sc.nextLine().trim();
            date = parseDate(input, dateFormat);
            if (date == null) {
                System.out.println("Date data is not valid");
            }
        } while (date == null);
        return date;
    }

    /*
    Nhập ngày tháng sau một ngày cho trước
     */
    public static Date readDateAfter(String prompt, String dateFormat,
            Date markedDate) {
        String input;
        Date date;
        boolean validDateAfter;
        do {
            System.out.print(prompt + ": ");
            input = sc.nextLine().trim();
            date = parseDate(input, dateFormat);
            validDateAfter = (date != null && date.after(markedDate));
            if (date == null) {
                System.out.println("Date data is not valid");
            }
        } while (!validDateAfter);
        return date;
    }

    // Nhập ngày tháng trước một ngày cho trước
    public static Date readDateBefore(String prompt, String dateFormat,
            Date markedDate) {
        String input;
        Date date;
        boolean validDateBefore;
        do {
            System.out.print(prompt + ": ");
            input = sc.nextLine().trim();
            date = parseDate(input, dateFormat);
            validDateBefore = (date != null && date.before(markedDate));
            if (date == null) {
                System.out.println("Date data is not valid");
            }
        } while (!validDateBefore);
        return date;
    }

    /*
    Automatically generating an increasing code
    Ví dụ: Sinh ra mã P0000123 -> prefix: P, length = 7, currentNumber = 123
     */
    public static String generateCode(String prefix, int length,
            int currentNumber) {
        String formatStr = "%0" + length + "d"; // -> %07d
        return prefix + String.format(formatStr, currentNumber);
    }
    
    // ---------------------------------------------- Object[] options ~ String... options
    public static int setChoice(Object[] options) {

        for (int i = 0; i < options.length; i++) {
            System.out.println((i + 1) + ". " + options[i]);
        }
        System.out.print("Your options from 1 - " + options.length + ": ");
        Scanner sc = new Scanner(System.in);
        return Integer.parseInt(sc.nextLine());
    }
    
    // ----------------------------------------------
    public static void title(String msg) {
        System.out.println("");
        System.out.println("------------------     " + msg + "     ------------------");
    }
    
    // ----------------------------------------------
    public static <T> void printAll(List<T> vehicleList) {
        title("DISPLAYING ALL VEHICLES");
        for (T vehicle : vehicleList) {
            System.out.println(vehicle);
            System.out.println("");
        }
    }
}
