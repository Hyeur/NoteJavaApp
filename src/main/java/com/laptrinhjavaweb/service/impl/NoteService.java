package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.dao.INoteDAO;
import com.laptrinhjavaweb.model.NoteModel;
import com.laptrinhjavaweb.service.INoteService;

import javax.inject.Inject;
import java.sql.Timestamp;
import java.util.List;

public class NoteService implements INoteService {

    @Inject
    private INoteDAO noteDAO;

    //    public NoteService() {
//        noteDAO = new NoteDAO();
//    }
    @Override
    public List<NoteModel> findAll(Integer offset, Integer limit, String sortTitle, String sortBy) {
        return noteDAO.findAll(offset, limit, sortTitle, sortBy);
    }

    @Override
    public List<NoteModel> findAllByUser(Integer offset, Integer limit, Long userId) {
        return noteDAO.findAllByUser(offset, limit, userId);
    }

    @Override
    public NoteModel save(NoteModel newNote) {
        newNote.setCreatedDate(new Timestamp(System.currentTimeMillis()));
        Long newId = noteDAO.save(newNote);
        return noteDAO.findOne(newId);
    }

    @Override
    public NoteModel update(NoteModel updateNote) {
        NoteModel oldNote = noteDAO.findOne(updateNote.getId());
        updateNote.setCreatedDate(oldNote.getCreatedDate());
        updateNote.setCreatedBy(oldNote.getCreatedBy());
        updateNote.setModifiedDate(new Timestamp(System.currentTimeMillis()));
        noteDAO.update(updateNote);
        return noteDAO.findOne(updateNote.getId());
    }


    @Override
    public int getTotalItem() {
        return noteDAO.getTotalItem();
    }

    @Override
    public void delete(Long id) {
        noteDAO.delete(id);
    }

    @Override
    public NoteModel findOne(Long id) {
        return noteDAO.findOne(id);
    }


}
