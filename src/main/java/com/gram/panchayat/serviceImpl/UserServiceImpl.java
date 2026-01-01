package com.gram.panchayat.serviceImpl;

import org.springframework.stereotype.Service;

import com.gram.panchayat.common.ApiResponse;
import com.gram.panchayat.common.GramPanchayatConstant;
import com.gram.panchayat.dto.UserDto;
import com.gram.panchayat.model.User;
import com.gram.panchayat.model.OtpVerification;
import com.gram.panchayat.repository.UserRepository;
import com.gram.panchayat.repository.OtpVerificationRepository;
import com.gram.panchayat.services.UserService;
import com.gram.panchayat.util.OtpUtil;
import com.gram.panchayat.util.SmsUtil;
import com.gram.panchayat.util.WhatsAppUtil;

import java.time.LocalDateTime;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {

	private final UserRepository userRepository;
	private final OtpVerificationRepository otpVerificationRepository;

	public UserServiceImpl(UserRepository userRepository, OtpVerificationRepository otpVerificationRepository) {
		this.userRepository = userRepository;
		this.otpVerificationRepository = otpVerificationRepository;
	}

	@Override
	public ApiResponse findUserAndSendOtp(String mobileNo) {
		Optional<User> user = userRepository.findByMobileNo(mobileNo);
		if (user.isEmpty()) {
			return new ApiResponse(true, "user not exist", null);
		} else {
			return sendUserOtp(mobileNo);
		}
	}

	@Override
	public ApiResponse registerUser(UserDto userDto) {

		boolean status = otpVerificationRepository.findTopByMobileNoOrderByCreatedDateDesc(userDto.getMobileNo())
				.filter(o -> !o.isExpired()).filter(o -> o.getOtpHash().equals(OtpUtil.hashOtp(userDto.getOtp())))
				.isPresent();

		if (!status) {
			return new ApiResponse(false, "Invalid OTP");
		} else {

			if (userDto.getUserRole().equalsIgnoreCase(GramPanchayatConstant.CITIZEN)) {
				return createUser(userDto);
			} else {
				Optional<User> usernameAlreadyExist = userRepository.findByUsername(userDto.getUsername());
				if (usernameAlreadyExist.isEmpty()) {
					return createUser(userDto);
				} else if (usernameAlreadyExist.get().getMobileNo().equals(userDto.getMobileNo())) {

					return new ApiResponse(true, "User already exist please login", null);
				} else {
					return new ApiResponse(true, "Username already used", null);
				}
			}

		}

	}

	ApiResponse createUser(UserDto userDto) {
		Optional<User> user = userRepository.findByMobileNo(userDto.getMobileNo());
		if (user.isEmpty()) {
			User userObject = new User();
			userObject.setFullName(userDto.getFullName());
			userObject.setUsername(userDto.getUsername());
			userObject.setMobileNo(userDto.getMobileNo());
			userObject.setEmail(userDto.getEmail());
			userObject.setUserRole(userDto.getUserRole());
			userObject.setActive(true);
			userObject.setUserRole(userDto.getUserRole());
			userRepository.save(userObject);
			return new ApiResponse(true, "User registration done ", userObject.getMobileNo());
		} else {
			return new ApiResponse(true, "Mobile number already exist please login", null);
		}
	}

	public ApiResponse sendUserOtp(String mobileNo) {

		String otp = OtpUtil.generateOtp();
		System.out.println("otp = " + otp);
		OtpVerification otpObj = new OtpVerification();
		otpObj.setMobileNo(mobileNo);
		otpObj.setOtpHash(OtpUtil.hashOtp(otp));
		otpObj.setExpiryTime(LocalDateTime.now().plusMinutes(5));
		otpVerificationRepository.save(otpObj);

		// send on whatapp message
		// whatsAppUtil.sendMessage(user.getMobileNo(), "use otp" + otp);

		// send text message
		// smsUtil.sendSms(user.getMobileNo(), "use otp", otp);
		return new ApiResponse(true, "OTP sent to mobile.", mobileNo);
	}

	@Override
	public Optional<User> findByMobileNo(String mobileNo) {
		return userRepository.findByMobileNo(mobileNo);
	}

	@Override
	public ApiResponse registerAdminUser(UserDto userDto) {

		Optional<User> usernameAlreadyExist = userRepository.findByUsername(userDto.getUsername());
		if (usernameAlreadyExist.isEmpty()) {

			Optional<User> user = userRepository.findByMobileNo(userDto.getMobileNo());
			if (user.isEmpty()) {
				User userObject = new User();
				userObject.setFullName(userDto.getFullName());
				userObject.setUsername(userDto.getUsername());
				userObject.setMobileNo(userDto.getMobileNo());
				userObject.setEmail(userDto.getEmail());
				userObject.setUserRole(userDto.getUserRole());
				userObject.setActive(true);
				userObject.setUserRole(userDto.getUserRole());
				userRepository.save(userObject);
				return new ApiResponse(true, "admin User created.", userObject.getRegUserId());
			} else {
				return new ApiResponse(true, "Mobile number already exist please login", null);
			}
		} else if (usernameAlreadyExist.get().getMobileNo().equals(userDto.getMobileNo())) {

			return new ApiResponse(true, "User already exist please login", null);
		} else {
			return new ApiResponse(true, "Username already used", null);
		}
	}

}
