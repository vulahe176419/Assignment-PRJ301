/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.authentication.authorization;

import controller.authentication.BaseRequiredAuthenticationController;
import entity.Role;
import dal.RoleDBContext;
import entity.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author leanh
 */
public abstract class BaseRBACController extends BaseRequiredAuthenticationController {

    private ArrayList<Role> getRoles(Account account,HttpServletRequest req)
    {
        RoleDBContext db = new RoleDBContext();
        String url = req.getServletPath();
        return db.getByUsernameAndUrl(account.getUsername(), url);
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException
    {
        ArrayList<Role> roles = getRoles(account,req);
        if(roles.size()<1)
        {
            resp.getWriter().println("access denied!");
        }
        else
        {
            doGet(req, resp, account, roles);
        }
    }
    
    protected abstract void doGet(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles)
            throws ServletException, IOException;

    @Override
    protected  void doPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException{
        ArrayList<Role> roles = getRoles(account,req);
        if(roles.size()<1)
        {
            resp.getWriter().println("access denied!");
        }
        else
        {
            doPost(req, resp, account, roles);
        }
    }
    
    protected abstract void doPost(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles)
            throws ServletException, IOException;
    
}
 