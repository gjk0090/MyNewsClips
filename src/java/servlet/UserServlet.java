/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Db.FinalFactory;
import dao.UserDAO;
import dao.UserDAOImpl;
import entities.User;

/**
 *
 * @author ivan
 */
public class UserServlet extends HttpServlet {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        doPost(request, response);

    }

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        String actiontype = request.getParameter("actiontype");

        System.out.println("action type is:" + actiontype);

        response.setContentType("text/html;charset=UTF-8");

        User user = new User();
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        System.out.println(username + "|" + password);

        if (username != null && !username.equals("")) {
            user.setUsername(username);
        }

        if (password != null && !password.equals("")) {
            user.setPassword(password);
        }

        if (request.getParameter("actiontype").equals("login")) {

            if (FinalFactory.getUserDAOInstance().userLogin(user)) {
                HttpSession session = request.getSession(true);
                session.setAttribute("name", username);

            }

        } else if (request.getParameter("actiontype").equals("register")) {

            if (FinalFactory.getUserDAOInstance().userRegister(user)) {
                HttpSession session = request.getSession(true);
                session.setAttribute("name", username);
                int userid = FinalFactory.getUserDAOInstance()
                        .findIdByUserName(username);
                user.setUserid(userid);
                FinalFactory.getUserDAOInstance().createDefault(user);

            }
        } 
        response.sendRedirect("RSS_reader.jsp");

    }
}
