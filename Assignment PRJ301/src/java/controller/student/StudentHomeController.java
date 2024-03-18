/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.student;

import controller.authentication.authorization.BaseRBACController;
import dal.StudentDBContext;
import entity.Account;
import entity.Role;
import entity.Student;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author leanh
 */
public class StudentHomeController extends BaseRBACController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String sname = (String) session.getAttribute("username");
        StudentDBContext stuDB = new StudentDBContext();
        Student students = stuDB.getStudentIdByName(sname);
        request.setAttribute("students", students);
        request.getRequestDispatcher("../view/student/studenthome.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        processRequest(req, resp);
    }

}
