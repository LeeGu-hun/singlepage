package vali_exception;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import member.MemberCommand;

public class LoginValidator implements Validator {
	@Override
	public boolean supports(Class<?> clazz) {
		return MemberCommand.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "memail", "이메일을 입력하시오.");
		ValidationUtils.rejectIfEmpty(errors, "mpw", "비번을 입력하시오.");	
	}

}
