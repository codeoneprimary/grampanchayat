package com.gram.panchayat.services;

import java.util.Optional;

import com.gram.panchayat.common.ApiResponse;
import com.gram.panchayat.dto.UserDto;
import com.gram.panchayat.model.User;

public interface UserService {

	ApiResponse findUserAndSendOtp(String mobileNo);

	ApiResponse registerUser(UserDto userDto);

	Optional<User> findByMobileNo(String mobileNo);

	ApiResponse registerAdminUser(UserDto userDto);

	ApiResponse sendUserOtp(String mobileNo);

}
