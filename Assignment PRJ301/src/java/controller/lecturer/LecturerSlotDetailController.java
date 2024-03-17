/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.lecturer;

import controller.authentication.authorization.BaseRBACController;
import dal.LessionDBContext;
import dal.TimeSlotDBContext;
import entity.Account;
import entity.Lession;
import entity.Role;
import entity.TimeSlot;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Map;
import util.DateTimeHelper;
import util.DetailsName;

/**
 *
 * @author leanh
 */
public class LecturerSlotDetailController extends BaseRBACController {
   
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        int leid = Integer.parseInt(req.getParameter("id"));
        TimeSlotDBContext timeDB = new TimeSlotDBContext();
        ArrayList<TimeSlot> slots = timeDB.list();
        
        String raw_from = req.getParameter("from");
        String raw_to = req.getParameter("to");
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
        ArrayList<Lession> lessions = lessDB.getLessionById(leid, from, to);
        
        Map<String, String> subjectDetails = DetailsName.getSubjectDetails();
        Map<String, String> lecturerDetails = DetailsName.getLecturerDetails();
        
        req.setAttribute("lecturerDetails", lecturerDetails);
        req.setAttribute("subjectDetails", subjectDetails);
        req.setAttribute("dates", DateTimeHelper.toList(from, to));
        req.setAttribute("from", from);
        req.setAttribute("to", to);
        req.setAttribute("slots", slots);
        req.setAttribute("lessions", lessions);
        req.getRequestDispatcher("../view/lecturer/slotdetail.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
