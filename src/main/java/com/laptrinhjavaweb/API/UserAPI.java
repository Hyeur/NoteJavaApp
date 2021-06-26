package com.laptrinhjavaweb.API;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.laptrinhjavaweb.model.NoteModel;
import com.laptrinhjavaweb.model.UserModel;
import com.laptrinhjavaweb.service.INoteService;
import com.laptrinhjavaweb.service.IUserService;
import com.laptrinhjavaweb.utils.HttpUtil;
import com.laptrinhjavaweb.utils.SessionUtil;

import javax.inject.Inject;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.rmi.ServerException;

@WebServlet(urlPatterns = {"/api-admin-user"})
public class UserAPI extends HttpServlet {

    @Inject
    private IUserService userService;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServerException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        UserModel userModel = HttpUtil.of(request.getReader()).toModel(UserModel.class);


        if (userService.findOneByUsername(userModel.getUserName()) < 0){
            userModel = userService.CreateNewUser(userModel);
        }
        mapper.writeValue(response.getOutputStream(),userModel);
    }
    protected void doPut (HttpServletRequest request, HttpServletResponse response) throws ServerException, IOException {

    }
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServerException, IOException {

    }


}
