package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.model.NoteModel;

import java.util.List;

public interface INoteService {
    List<NoteModel>findAll(Integer offset, Integer limit, String sortTitle, String sortBy);

    List<NoteModel>findAllByUser(Integer offset, Integer limit, Long userId);

    NoteModel save(NoteModel newNote);

    NoteModel update(NoteModel updateNote);
    int getTotalItem();
    void delete(Long id);
    NoteModel findOne(Long id);
}
