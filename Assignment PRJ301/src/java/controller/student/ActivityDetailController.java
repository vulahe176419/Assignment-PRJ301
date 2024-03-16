/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.student;

import dal.LessionDBContext;
import dal.TimeSlotDBContext;
import entity.Lession;
import entity.TimeSlot;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.ArrayList;
import util.DateTimeHelper;

/**
 *
 * @author leanh
 */
public class ActivityDetailController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ActivityDetailController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ActivityDetailController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int gid = Integer.parseInt(request.getParameter("id"));
        TimeSlotDBContext timeDB = new TimeSlotDBContext();
        ArrayList<TimeSlot> slots = timeDB.list();
        
        String raw_from = request.getParameter("from");
        String raw_to = request.getParameter("to");
        Date from = null;
        Date to = null;
        java.util.Date today = new java.util.Date();
        if(raw_from ==null)
        {
           from = DateTimeHelper.convertUtilToSql(DateTimeHelper.getBeginningOfWeek(today));
        }
        else
        {
           from = Date.valueOf(raw_from);
        }
        
        if(raw_to == null)
        {
           java.util.Date beginWeek = DateTimeHelper.getBeginningOfWeek(today);
           to= DateTimeHelper.convertUtilToSql(DateTimeHelper.addDaysToDate(beginWeek, 6));
        }
        else
        {
            to = Date.valueOf(raw_to);
        }
        
        LessionDBContext lessDB = new LessionDBContext();
        ArrayList<Lession> lessions = lessDB.getLessionByGroupId(gid, from, to);
        
        request.setAttribute("dates", DateTimeHelper.toList(from, to));
        request.setAttribute("from", from);
        request.setAttribute("to", to);
        request.setAttribute("slots", slots);
        request.setAttribute("lessions", lessions);
        request.getRequestDispatcher("../view/student/activitydetail.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
