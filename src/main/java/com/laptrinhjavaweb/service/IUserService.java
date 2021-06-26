package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.model.UserModel;

public interface IUserService {
    UserModel findByUserNameAndPasswordAndStatus(String userName, String passWord, Integer status);

    int getTotalItemByUser(Long id);

    UserModel CreateNewUser(UserModel newUser);

    UserModel findOne(Long id);

    int findOneByUsername(String userName);
}
