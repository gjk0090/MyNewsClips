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
import entities.ArticleFolder;
import entities.User;
import java.util.ArrayList;

/**
 *
 * @author gjk
 */
public class ArticleServlet extends HttpServlet {

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

        HttpSession session = request.getSession(true);
                                                                
        response.setContentType("text/html;charset=UTF-8");

        String aid = request.getParameter("aid");
        String atitle = request.getParameter("atitle");
        String content = request.getParameter("content");
        String link = request.getParameter("link");
        String name = (String) session.getAttribute("name");
        int uid = FinalFactory.getUserDAOInstance().findIdByUserName(name);
        String afid = request.getParameter("afid");
        
        if(afid.equals("-1")){
            ArrayList<ArticleFolder> articlefolder = new ArrayList<ArticleFolder>();

            articlefolder = FinalFactory.getRssDAOInstance().findArticleFolderByUserID(uid);
        
            afid = articlefolder.get(0).getArticle_folder_id().toString();
        }
        
        
        
        
        

        if (request.getParameter("actiontype").equals("save")) {

            FinalFactory.getRssDAOInstance().addArticle(aid, atitle, content, link, uid, afid);

        } else if (request.getParameter("actiontype").equals("cancel")) {
            

        } 
        response.sendRedirect("news_clip.jsp");

    }
}
