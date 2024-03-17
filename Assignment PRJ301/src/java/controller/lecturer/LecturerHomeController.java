/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.lecturer;

import controller.authentication.authorization.BaseRBACController;
import dal.LecturerDBContext;
import entity.Account;
import entity.Lecturer;
import entity.Role;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author leanh
 */
public class LecturerHomeController extends BaseRBACController {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        req.getRequestDispatcher("../view/lecturer/lecturerhome.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String username = (String) session.getAttribute("username");
        LecturerDBContext lecDB = new LecturerDBContext();
        ArrayList<Lecturer> lecturers = lecDB.getLecturerIdByUsername(username);
        req.setAttribute("lecturers", lecturers);
        req.getRequestDispatcher("../view/lecturer/lecturerhome.jsp").forward(req, resp);
    }

}
