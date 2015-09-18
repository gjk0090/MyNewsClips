/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.User;

/**
 *
 * @author ivan
 */
public interface UserDAO {

    public boolean userLogin(User user);

    public boolean userRegister(User user);
    
    //create default folder for new user
    public boolean createDefault(User user);

    public boolean isUserExist(User user);
    
	// find userid by username
	public Integer findIdByUserName(String username);

}
