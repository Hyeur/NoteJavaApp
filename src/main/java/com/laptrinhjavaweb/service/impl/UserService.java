package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.dao.IUserDAO;
import com.laptrinhjavaweb.dao.impl.UserDAO;
import com.laptrinhjavaweb.model.UserModel;
import com.laptrinhjavaweb.service.IUserService;

import javax.inject.Inject;
import java.sql.Timestamp;

public class UserService implements IUserService {

    @Inject
    private IUserDAO userDAO;

    @Override
    public UserModel findByUserNameAndPasswordAndStatus(String userName, String passWord, Integer status) {
        return userDAO.findByUserNameAndPasswordAndStatus(userName, passWord, status);
    }

    @Override
    public int getTotalItemByUser(Long id) {
        return userDAO.getTotalItemByUser(id);
    }

    @Override
    public UserModel CreateNewUser(UserModel newUser) {
        newUser.setCreatedDate(new Timestamp(System.currentTimeMillis()));
        Long userId = userDAO.CreateNewUser(newUser);
        return userDAO.findOne(userId);
    }

    @Override
    public UserModel findOne(Long id) {
        return userDAO.findOne(id);
    }

    @Override
    public int findOneByUsername(String userName) {
        return userDAO.findOneByUsername(userName);
    }
}
