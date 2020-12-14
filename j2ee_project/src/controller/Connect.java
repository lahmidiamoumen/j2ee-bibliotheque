package controller;

import Dao.DaoAdmin;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class Connect extends HttpServlet {
    private HttpSession session;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id ;
        session = req.getSession();

        String username = req.getParameter("username").trim();
        String password = req.getParameter("password").trim();
        DaoAdmin daoAdmin = DaoAdmin.getInstance();

        id = daoAdmin.getAuthentication(username,password);

        if(id>0){
            try{
                session.setAttribute("userIsConnected", "CONNECTED");
            }catch (Exception c){
                System.out.println(c.getMessage());
            }
            resp.sendRedirect("home");
        }
        else{
            resp.sendRedirect("home?action=account&error=0");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(req.getParameter("log").trim().equals("out")){
            session.invalidate();
            resp.sendRedirect("home");
            return;
        }

    }
}
