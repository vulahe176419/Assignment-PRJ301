/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Attendance;
import entity.Lecturer;
import entity.Student;
import entity.StudentGroup;
import entity.Subject;
import java.util.ArrayList;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author leanh
 */
public class AttendanceDBContext extends DBContext<Attendance> {

    @Override
    public ArrayList<Attendance> list() {
        ArrayList<Attendance> atts = new ArrayList<>();
        try {

            String sql = """
                         SELECT aid
                               ,leid
                               ,sid
                               ,description
                               ,isPresent
                               ,capturedtime
                           FROM Attendance""";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendance a = new Attendance();
                a.setId(rs.getInt("aid"));
                a.setDescription(rs.getString("description"));
                a.setPresent(rs.getBoolean("isPresent"));
                a.setTime(rs.getDate("capturedtime"));
                atts.add(a);
            }

        } catch (SQLException ex) {
            Logger.getLogger(TimeSlotDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return atts;
    }

    public ArrayList<Attendance> getAttendanceByStudentId(int sid) {
        ArrayList<Attendance> atts = new ArrayList<>();
        try {
            String sql = """
                         SELECT sub.suname, g.gname, l.lname, s.sname, description, isPresent
                                      FROM Attendance A INNER JOIN Lession le ON le.leid = a.leid 
                                      INNER JOIN StudentGroup g ON g.gid = le.gid 
                                      INNER JOIN [Subject] sub ON sub.subid = g.subid 
                                      INNER JOIN Student s ON s.sid = a.sid 
                                      INNER JOIN Lecturer l ON l.lid = le.lid 
                                      WHERE a.sid = ?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                StudentGroup g = new StudentGroup();
                Lecturer l = new Lecturer();
                Attendance a = new Attendance();
                Subject sub = new Subject();
                
                s.setId(rs.getInt("sid"));
                s.setName(rs.getString("sname"));
                sub.setName(rs.getString("suname"));
                l.setName(rs.getString("lname"));
                g.setName(rs.getString("gname"));
                a.setDescription(rs.getString("description"));
                a.setPresent(rs.getBoolean("isPresent"));
                
                a.setStudent(s);
                a.setLecturer(l);
                a.setGroup(g);
                a.setSubject(sub);
                
                atts.add(a);
            }

        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return atts;
    }

    @Override
    public void insert(Attendance entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Attendance entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Attendance entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Attendance get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
