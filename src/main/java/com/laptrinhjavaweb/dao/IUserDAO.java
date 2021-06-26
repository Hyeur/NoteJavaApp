package com.laptrinhjavaweb.dao;

import com.laptrinhjavaweb.model.NoteModel;
import com.laptrinhjavaweb.model.UserModel;

import java.util.List;

public interface IUserDAO extends GenericDAO<UserModel> {
    UserModel findByUserNameAndPasswordAndStatus(String userName, String passWord, Integer status);

    Long CreateNewUser(UserModel newUser);

    int getTotalItemByUser(Long id);

    UserModel findOne(Long id);

    int findOneByUsername(String userName);
}
