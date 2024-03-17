/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author leanh
 */
public class DetailsName {

    public static Map<String, String> getSubjectDetails() {
        Map<String, String> subjectDetails = new HashMap<>();
        subjectDetails.put("MAS291", "Statistics and Probability");
        subjectDetails.put("JPD123", "Elementary Japanese 1-A1.2");
        subjectDetails.put("IOT102", "Internet of Things");
        subjectDetails.put("PRJ301", "Java Web Application Development");
        subjectDetails.put("SWE201c", "Introduction to Software Engineering");
        subjectDetails.put("LAB211", "OOP with Java Lab");
        subjectDetails.put("DBI202", "Introduction to Databases");
        subjectDetails.put("CSD201", "Data Structures and Algorithms");
        subjectDetails.put("JPD113", "Elementary Japanese 1-A1.1");
        subjectDetails.put("WED201c", "Web Design");
        return subjectDetails;
    }
    
    public static Map<String, String> getLecturerDetails() {
        Map<String, String> lecturerDetails = new HashMap<>();
        lecturerDetails.put("sonnt", "Ngo Tung Son");
        lecturerDetails.put("thuyntt", "Nguyen Thi Thu Thuy");
        lecturerDetails.put("namtq", "Truong Quoc Nam");
        lecturerDetails.put("tiennv", "Nguyen Van Tien");
        return lecturerDetails;
    }
}
