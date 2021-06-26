package com.laptrinhjavaweb.dao;

import com.laptrinhjavaweb.model.NoteModel;

import java.util.List;

public interface INoteDAO extends GenericDAO<NoteModel> {
    List<NoteModel> findAll(Integer offset, Integer limit, String sortTitle, String sortBy);


    List<NoteModel> findAllByUser(Integer offset, Integer limit, Long userId);


    Long save(NoteModel newNote);

    void update(NoteModel updateNote);

    int getTotalItem();

    void delete(Long id);

    NoteModel findOne(Long id);
}
