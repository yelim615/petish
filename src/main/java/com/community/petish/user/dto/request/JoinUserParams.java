package com.community.petish.user.dto.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class JoinUserParams {

	private String email;
	private String password;
	private String nickname;
	private String address;
	private String gender;
	private String profileImage;
	private String concern;
	
}