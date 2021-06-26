package com.laptrinhjavaweb.mapper;

import com.laptrinhjavaweb.model.NoteModel;

import java.sql.ResultSet;
import java.sql.SQLException;

public class NoteMapper implements RowMapper<NoteModel> {

    @Override
    public NoteModel mapRow(ResultSet resultSet) {
        try {
            NoteModel note = new NoteModel();
            note.setId(resultSet.getLong("id"));
            note.setUserId(resultSet.getLong("userid"));
            note.setTitle(resultSet.getString("title"));
            note.setContent(resultSet.getString("content"));
            note.setCreatedDate(resultSet.getTimestamp("createddate"));
            note.setModifiedDate(resultSet.getTimestamp("modifieddate"));
            note.setCreatedBy(resultSet.getString("createdby"));
            note.setModifiedBy(resultSet.getString("modifiedby"));
            if (resultSet.getTimestamp("modifieddate") != null){
                note.setModifiedDate(resultSet.getTimestamp("modifieddate"));
            }
            if (resultSet.getString("modifiedby") != null){
                note.setModifiedBy(resultSet.getString("modifiedby"));
            }
            return note;
        } catch (SQLException e){
            return null;
        }
    }
}
