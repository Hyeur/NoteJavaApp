package com.laptrinhjavaweb.dao.impl;

import com.laptrinhjavaweb.dao.INoteDAO;
import com.laptrinhjavaweb.mapper.NoteMapper;
import com.laptrinhjavaweb.model.NoteModel;

import java.util.List;

public class NoteDAO extends AbstractDAO<NoteModel> implements INoteDAO {

    @Override
    public List<NoteModel> findAll(Integer offset, Integer limit, String sortTitle, String sortBy) {
        StringBuilder sql = new StringBuilder("SELECT * FROM note");
        if (sortTitle != null && sortBy != null) {
            sql.append(" ORDER BY "+sortTitle+" "+sortBy+"");
        }
        if (offset != null && limit != null) {
            sql.append(" LIMIT "+offset+", "+limit+"");
        }

        return query(sql.toString(), new NoteMapper());
    }

    @Override
    public List<NoteModel> findAllByUser(Integer offset, Integer limit, Long userId) {
        StringBuilder sql = new StringBuilder("SELECT * FROM note");
        if (userId != null){
            sql.append(" WHERE userid = "+userId+"");
        }
        if (offset != null && limit != null) {
            sql.append(" LIMIT "+offset+", "+limit+"");
        }
        return query(sql.toString(), new NoteMapper());
    }

    @Override
    public Long save(NoteModel newNote) {
        StringBuilder sql = new StringBuilder("INSERT INTO note (title, content,");
        sql.append(" userid, createddate, createdby)");
        sql.append(" VALUES (?,?,?,?,?)");
        return insert(sql.toString(), newNote.getTitle(), newNote.getContent(), newNote.getUserId(), newNote.getCreatedDate(), newNote.getCreatedBy());
    }

    @Override
    public int getTotalItem() {
        String sql = "SELECT count(*) FROM note";
        return count(sql);
    }


    @Override
    public void delete(Long id) {
        String sql = "DELETE FROM note WHERE id = ?";
        update(sql, id);
    }

    @Override
    public NoteModel findOne(Long id) {
        String sql = "SELECT * FROM note WHERE id = ?";
        List<NoteModel> notes = query(sql,new NoteMapper(), id);
        return notes.isEmpty() ? null : notes.get(0);
    }

    @Override
    public void update(NoteModel updateNote) {
        StringBuilder sql = new StringBuilder("UPDATE note SET title = ?, content = ?,");
        sql.append(" createddate = ?, createdby = ?, modifieddate = ?, modifiedby = ? WHERE id = ?");
        update(sql.toString(), updateNote.getTitle(), updateNote.getContent(), updateNote.getCreatedDate(), updateNote.getCreatedBy(), updateNote.getModifiedDate(), updateNote.getModifiedBy() ,updateNote.getId());
    }

    public void delete(NoteModel deleteNote) {
        String sql = "DELETE FROM note WHERE id = ?";
        this.update(sql, deleteNote.getId());
    }
}
