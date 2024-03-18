/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.lecturer;

import controller.authentication.BaseRequiredAuthenticationController;
import controller.authentication.authorization.BaseRBACController;
import dal.LessionDBContext;
import dal.StudentDBContext;
import entity.Account;
import entity.Attendance;
import entity.Lession;
import entity.Role;
import entity.Student;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Map;
import util.DetailsName;

/**
 *
 * @author leanh
 */
public class AttendanceTakingController extends BaseRBACController {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account,ArrayList<Role> roles) throws ServletException, IOException {
        int leid = Integer.parseInt(req.getParameter("id"));
        StudentDBContext db = new StudentDBContext();
        ArrayList<Student> students = db.getStudentsByLessionId(leid);
        Lession lession = new Lession();
        lession.setId(leid);
        ArrayList<Attendance> atts = new ArrayList<>();
        for (Student student : students) {
            Attendance att = new Attendance();
            att.setStudent(student);
            att.setLession(lession);
            att.setDescription(req.getParameter("description"+student.getId()));
            att.setPresent(req.getParameter("present"+student.getId()).equals("yes"));
            atts.add(att);
        }
        LessionDBContext lesDB = new LessionDBContext();
        lesDB.takeAttendance(leid, atts);
        resp.sendRedirect("att?id="+leid);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account,ArrayList<Role> roles) throws ServletException, IOException {
        int leid = Integer.parseInt(req.getParameter("id"));
        
        Map<String, String> studentDetails = DetailsName.getStudentDetails();
        
        req.setAttribute("studentDetails", studentDetails);
        LessionDBContext lesDB = new LessionDBContext();
        ArrayList<Attendance> atts = lesDB.getAttendancesByLession(leid);
        req.setAttribute("atts", atts);
        req.getRequestDispatcher("../view/lecturer/att.jsp").forward(req, resp);
        
    }
}
