package com.laptrinhjavaweb.controller.web;

import com.laptrinhjavaweb.model.UserModel;
import com.laptrinhjavaweb.service.IUserService;
import com.laptrinhjavaweb.utils.SessionUtil;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ResourceBundle;

@WebServlet(urlPatterns = {"/Home", "/Login", "/Logout", "/PageNotFound","/Sign"})
public class HomeController extends HttpServlet {

    ResourceBundle mybundle = ResourceBundle.getBundle("message");
    @Inject
    private IUserService userService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action != null && action.equals("login")) {
            String message = request.getParameter("message");
            String alert = request.getParameter("alert");
            if (message != null && alert != null) {
                request.setAttribute("message", mybundle.getString(message));
                request.setAttribute("alert", alert);
            }
            RequestDispatcher rd = request.getRequestDispatcher("/views/login.jsp");
            rd.forward(request, response);
        } else if (action != null && action.equals("logout")) {
            SessionUtil.getInstance().remove(request, "USERMODEL");
            response.sendRedirect(request.getContextPath() + "/Home");
        } else if (action != null && action.equals("404")) {
            RequestDispatcher rd = request.getRequestDispatcher("/views/404.jsp");
            rd.forward(request, response);
        } else if (action != null && action.equals("sign")) {
            String message = request.getParameter("message");
            String alert = request.getParameter("alert");
            if (message != null && alert != null) {
                request.setAttribute("message", mybundle.getString(message));
                request.setAttribute("alert", alert);
            }

            RequestDispatcher rd = request.getRequestDispatcher("/views/SignUp.jsp");
            rd.forward(request, response);
        }
        else {
            RequestDispatcher rd = request.getRequestDispatcher("/views/admin/home.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null && action.equals("sign")) {
            String username = request.getParameter("userName");
            int isExist = userService.findOneByUsername(username);
            if (isExist > 0) {
                response.sendRedirect(request.getContextPath() + "/Sign?action=sign&message=username_exist&alert=danger");
            }
        }



        if (action != null && action.equals("login")) {
            UserModel userModel = new UserModel();
            String username = request.getParameter("userName");
            String password = request.getParameter("passWord");
            if (username != null) {
                userModel.setUserName(username);
            }
            if (password != null) {
                userModel.setPassWord(password);
            }
            userModel = userService.findByUserNameAndPasswordAndStatus(userModel.getUserName(), userModel.getPassWord(), 1);
            if (userModel != null) {
                SessionUtil.getInstance().pushValue(request, "USERMODEL", userModel);
                if (userModel.getRole().getCode().equals("USER")) {
                    response.sendRedirect(request.getContextPath() + "/Home");
                } else if (userModel.getRole().getCode().equals("ADMIN")) {
                    response.sendRedirect(request.getContextPath() + "/Home");
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/Login?action=login&message=username_password_invalid&alert=danger");
            }
        }

    }
}
