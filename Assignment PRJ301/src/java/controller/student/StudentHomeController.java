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

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        req.getRequestDispatcher("../view/student/studenthome.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session != null) {
            Account loggedInAccount = (Account) session.getAttribute("account");
            if (loggedInAccount != null) {
                String username = loggedInAccount.getUsername();

                // Now you can use the username as needed
                StudentDBContext stuDB = new StudentDBContext();
                ArrayList<Student> students = stuDB.getStudentIdByUsername(username);
                req.setAttribute("students", students);
                req.getRequestDispatcher("../view/student/studenthome.jsp").forward(req, resp);
            } else {
                // Handle case where account is not found in session
                // This could mean user is not logged in
            }
        } else {
            // Handle case where session is null
            // This could mean user is not logged in
        }
    }

}
