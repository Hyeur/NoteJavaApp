package com.laptrinhjavaweb.API;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.laptrinhjavaweb.model.NoteModel;
import com.laptrinhjavaweb.model.UserModel;
import com.laptrinhjavaweb.service.INoteService;
import com.laptrinhjavaweb.utils.HttpUtil;
import com.laptrinhjavaweb.utils.SessionUtil;

import javax.inject.Inject;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.rmi.ServerException;

@WebServlet(urlPatterns = {"/api-admin-note"})
public class NoteAPI extends HttpServlet {

    @Inject
    private INoteService noteService;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServerException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        NoteModel noteModel = HttpUtil.of(request.getReader()).toModel(NoteModel.class);
        noteModel.setCreatedBy(((UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL")).getUserName());
        noteModel.setUserId(((UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL")).getId());
        noteModel = noteService.save(noteModel);
        mapper.writeValue(response.getOutputStream(),noteModel);
    }
    protected void doPut (HttpServletRequest request, HttpServletResponse response) throws ServerException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        NoteModel updateNote = HttpUtil.of(request.getReader()).toModel(NoteModel.class);
        updateNote.setModifiedBy(((UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL")).getUserName());
        updateNote = noteService.update(updateNote);
        mapper.writeValue(response.getOutputStream(),updateNote);
    }
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServerException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        NoteModel noteModel = HttpUtil.of(request.getReader()).toModel(NoteModel.class);
        noteService.delete(noteModel.getId());
        mapper.writeValue(response.getOutputStream(), "{}");
    }


}
