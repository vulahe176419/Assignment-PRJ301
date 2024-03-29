/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.authentication;

import dal.AccountDBContext;
import dal.RoleDBContext;
import entity.Account;
import entity.Role;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author leanh
 */
public class LoginController extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/authentication/login.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        AccountDBContext db = new AccountDBContext();
        Account account = db.getAccountByUsernamePassword(username, password);
        if (account != null) {
            HttpSession session = request.getSession();

            //implement remember me!
            Cookie c_username = new Cookie("username", username);
            c_username.setMaxAge(3600 * 24 * 7);
            Cookie c_password = new Cookie("password", password);
            c_password.setMaxAge(3600 * 24 * 7);

            response.addCookie(c_username);
            response.addCookie(c_password);

            session.setAttribute("username", username);
            session.setAttribute("account", account);

            RoleDBContext roleDB = new RoleDBContext();
            ArrayList<Role> roles = roleDB.getRolesByUsername(username);

            boolean isStudent = false;
            boolean isLecturer = false;
            boolean isStaff = false;

            for (Role role : roles) {
                if (role.getName().equalsIgnoreCase("Student")) {
                    isStudent = true;
                } else if (role.getName().equalsIgnoreCase("Lecturer")) {
                    isLecturer = true;
                } else if (role.getName().equalsIgnoreCase("Staff")) {
                    isStaff = true;
                }
            }
            if (isStudent) {
                response.sendRedirect("student/studenthome");
            } else if (isLecturer) {
                response.sendRedirect("lecturer/lecturerhome");
            } else if (isStaff) {
                response.sendRedirect("staff/staffhome");
            } else {
                response.getWriter().println("login failed!");
            }
        } else {
            response.getWriter().println("login failed!");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
