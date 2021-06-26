package com.laptrinhjavaweb.controller.web;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.model.NoteModel;
import com.laptrinhjavaweb.model.UserModel;
import com.laptrinhjavaweb.service.INoteService;
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

@WebServlet(urlPatterns = {"/user-notes-list"})
public class UserNoteController extends HttpServlet {

    @Inject
    private INoteService noteService;

    @Inject
    private IUserService userService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        NoteModel noteModel = new NoteModel();

        String action_code = request.getParameter("type");
        if (action_code != null) {
            noteModel.setType(action_code);
        }

        String view = "";

        if (noteModel.getType().equals(SystemConstant.LIST)) {
            String pageStr = request.getParameter("to-page");
            String maxPageItemStr = request.getParameter("maxPageItem");
            if (pageStr != null) {
                noteModel.setPage(Integer.parseInt(pageStr));
            } else noteModel.setPage(1);
            if (maxPageItemStr != null) {
                noteModel.setMaxPageItem(Integer.parseInt(maxPageItemStr));
            }
            Integer offset = (noteModel.getPage() - 1) * noteModel.getMaxPageItem();

            noteModel.setListResult(noteService.findAllByUser(offset, noteModel.getMaxPageItem(), ((UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL")).getId()));
            noteModel.setTotalItem(userService.getTotalItemByUser(((UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL")).getId()));
            noteModel.setTotalPage((int) Math.ceil((double) noteModel.getTotalItem() / noteModel.getMaxPageItem()));
            view = "/views/web/note.jsp";
        } else if (noteModel.getType().equals(SystemConstant.EDIT)) {
            if (noteModel.getId() != null) {
                noteModel = noteService.findOne(noteModel.getId());


            } else {

            }
            view = "/views/web/note.jsp";
        } else if (noteModel.getType().equals(SystemConstant.ADD)) {
            if (noteModel.getId() != null) {
                noteModel = noteService.findOne(noteModel.getId());
            }

            view = "/views/addnote.jsp";
        }
        request.setAttribute(SystemConstant.MODEL, noteModel);

        RequestDispatcher rd = request.getRequestDispatcher(view);
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
