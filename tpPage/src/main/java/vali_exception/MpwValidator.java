package vali_exception;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import member.MemberCommand;

public class MpwValidator implements Validator {
	@Override
	public boolean supports(Class<?> clazz) {
		return MemberCommand.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		MemberCommand memCmd = (MemberCommand) target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mpw", "현재 비번을 입력하시오.");
		ValidationUtils.rejectIfEmpty(errors, "newmpw", "새 비번을 입력하시오.");
		ValidationUtils.rejectIfEmpty(errors, "newmpwconf", "새비번확인하시오.");
		if (!memCmd.getMpw().isEmpty()) {
			if (!memCmd.isoldmpwEqualTonewmpw()) {
				errors.rejectValue("mpwconf", "비밀번호와 동일하게 입력하시오.");
			}
		}
	}
}