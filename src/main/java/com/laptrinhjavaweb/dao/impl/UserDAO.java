package com.laptrinhjavaweb.dao.impl;

import com.laptrinhjavaweb.dao.IUserDAO;
import com.laptrinhjavaweb.mapper.NoteMapper;
import com.laptrinhjavaweb.mapper.UserMapper;
import com.laptrinhjavaweb.model.NoteModel;
import com.laptrinhjavaweb.model.UserModel;

import java.util.List;

public class UserDAO extends AbstractDAO<UserModel> implements IUserDAO {
    @Override
    public UserModel findByUserNameAndPasswordAndStatus(String userName, String passWord, Integer status) {
        StringBuilder sql = new StringBuilder("SELECT * FROM user");
        sql.append(" INNER JOIN role ON role.id = user.roleid");
        sql.append(" WHERE username = ? AND password = ? AND status = ?");
        List<UserModel> users = query(sql.toString(), new UserMapper(), userName, passWord, status);
        return users.isEmpty() ? null : users.get(0);
    }

    @Override
    public Long CreateNewUser(UserModel newUser) {
        String sql = "INSERT INTO user (fullname,username,password,status,roleid) VALUES (?,?,?,1,2)";
        return insert(sql, newUser.getFullName(), newUser.getUserName(), newUser.getPassWord());
    }

    @Override
    public int getTotalItemByUser(Long id) {
        String sql = "SELECT count(*) FROM note WHERE userid = ?";
        return count(sql, id);
    }

    @Override
    public UserModel findOne(Long id) {
        String sql = "SELECT * FROM user WHERE id = ?";
        List<UserModel> user = query(sql,new UserMapper(), id);
        return user.isEmpty() ? null : user.get(0);
    }

    @Override
    public int findOneByUsername(String userName) {
        String sql = "SELECT count(*) FROM user WHERE username = ?";
        return count(sql,userName);
    }
}
