/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.student;

import controller.authentication.authorization.BaseRBACController;
import dal.SubjectDBContext;
import entity.Account;
import entity.Role;
import entity.Subject;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Map;
import util.DetailsName;

/**
 *
 * @author leanh
 */
public class SubjectDetailController extends BaseRBACController {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        SubjectDBContext subDB = new SubjectDBContext();
        ArrayList<Subject> subjects = subDB.list();
        
        Map<String, String> subjectDetails = DetailsName.getSubjectDetails();
        req.setAttribute("subjectDetails", subjectDetails);
        req.setAttribute("subjects", subjects);
        req.getRequestDispatcher("view/student/subjectdetail.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {

    }

}
