package com.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.dto.FreeBoardDTO;

public class FreeBoardValidator implements Validator {

	@Override
	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return FreeBoardDTO.class.equals(arg0);
	}

	@Override
	public void validate(Object obj, Errors e) {
		System.out.println("validate");
		FreeBoardDTO dto = (FreeBoardDTO) obj;
		if(dto.getAuthor().length()==0) {
			e.rejectValue("author", "length");
		}
		if(dto.getTitle().length()==0) {
			e.rejectValue("title", "length2");
		}
		if(dto.getContent().length()==0) {
			e.rejectValue("content", "length3");
		}
		if(dto.getImage().length()==0) {
			e.rejectValue("image", "length4");
		}

	}

}
