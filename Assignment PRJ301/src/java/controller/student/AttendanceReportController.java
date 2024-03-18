/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.student;

import controller.authentication.authorization.BaseRBACController;
import dal.AttendanceDBContext;
import entity.Account;
import entity.Attendance;
import entity.Role;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author leanh
 */
public class AttendanceReportController extends BaseRBACController {
   
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        int sid = Integer.parseInt(req.getParameter("id"));
        AttendanceDBContext attDB = new AttendanceDBContext();
        ArrayList<Attendance> atts = attDB.getAttendanceByStudentId(sid);
        
        req.setAttribute("atts", atts);
        req.getRequestDispatcher("../student/attreport.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
