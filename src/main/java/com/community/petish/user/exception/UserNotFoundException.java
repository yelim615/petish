package com.community.petish.user.exception;

public class UserNotFoundException extends RuntimeException{

	public UserNotFoundException() {}

	public UserNotFoundException(String msg) {
		super(msg);
	}

}