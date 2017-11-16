package vali_exception;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import member.MemberCommand;

public class JoinValidator implements Validator {
	private static final String emailRegExp =
			"^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" +
			"[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
	private Pattern pattern;

	public JoinValidator() {
		pattern = Pattern.compile(emailRegExp);
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return MemberCommand.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		MemberCommand memCmd = (MemberCommand) target;
		if (memCmd.getMemail() == null || memCmd.getMemail().trim().isEmpty()) {
			errors.rejectValue("memail", "required");
		} else {
			Matcher matcher = pattern.matcher(memCmd.getMemail());
			if (!matcher.matches()) {
				errors.rejectValue("memail", "bad");
			}
		}
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mname", "required");
		ValidationUtils.rejectIfEmpty(errors, "mpw", "required");
		ValidationUtils.rejectIfEmpty(errors, "mpwconf", "required");
		if (!memCmd.getMpw().isEmpty()) {
			if (!memCmd.isPasswordEqualToConfirmPassword()) {
				errors.rejectValue("mpwconf", "nomatch");
			}
		}
	}
}