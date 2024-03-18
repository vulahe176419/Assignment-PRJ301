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
    
    public static Map<String, String> getStudentDetails() {
        Map<String, String> StudentDetails = new HashMap<>();
        StudentDetails.put("annv", "Nguyen Van An");
        StudentDetails.put("anhld", "Le Duc Anh");
        StudentDetails.put("anhnp", "Nguyen Phuong Anh");
        StudentDetails.put("duongtt", "Tran Thai Duong");
        StudentDetails.put("dungbt", "Bui Tien Dung");
        StudentDetails.put("datht", "Hoang Tien Dat");
        StudentDetails.put("huytv", "Trinh Viet Huy");
        StudentDetails.put("tungnq", "Nguyen Quang Tung");
        StudentDetails.put("tuandq", "Dinh Quang Tuan");
        StudentDetails.put("linhln", "Le Ngoc Linh");
        StudentDetails.put("trangnt", "Nguyen Thu Trang");
        StudentDetails.put("baopq", "Pham Quang Bao");
        StudentDetails.put("phuongnm", "Nguyen Minh Phuong");
        StudentDetails.put("thanhtv", "Truong Van Thanh");
        StudentDetails.put("bachlh", "Le Huy Bach");
        StudentDetails.put("vancq", "Chu Quynh Van");
        StudentDetails.put("tienlx", "Luong Xuan Tien");
        StudentDetails.put("nampv", "Phan Van Nam");
        StudentDetails.put("thangnd", "Nguyen Dinh Thang");
        StudentDetails.put("dattt", "Tran Tien Dat");
        StudentDetails.put("tienla", "Le Anh Tien");
        StudentDetails.put("haiha", "Hoang An Hai");
        StudentDetails.put("nghiatv", "Trinh Van Nghia");
        StudentDetails.put("anhph", "Pham Hoang Anh");
        StudentDetails.put("duclv", "Le Van Duc");
        StudentDetails.put("sondn", "Dinh Ngoc Son");
        StudentDetails.put("anhnn", "Nguyen Ngoc Anh");
        StudentDetails.put("tulm", "Luu Minh Tu");
        StudentDetails.put("ducch", "Chu Hong Duc");
        StudentDetails.put("minhvq", "Vu Quang Minh");
        return StudentDetails;
    }
    
}
