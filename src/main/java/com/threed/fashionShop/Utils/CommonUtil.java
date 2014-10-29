package com.threed.fashionShop.Utils;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.ServletRequestAttributes;

public class CommonUtil {

	public static String UTF8_ENCODING = "UTF-8";
	
	// Default encoding is UTF-8
	public static void setCharacterEncoding(RequestAttributes requestAttributes){
		setCharacterEncoding(requestAttributes, UTF8_ENCODING);
	}
	
	// set request and response to encoding.
	public static void setCharacterEncoding(RequestAttributes requestAttributes, String encoding){
		HttpServletRequest  request  = ((ServletRequestAttributes) requestAttributes).getRequest();
		HttpServletResponse response = ((ServletRequestAttributes) requestAttributes).getResponse();
		
		try {
			request.setCharacterEncoding(encoding);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			System.out.println("CAN'T ENCODE TO " + encoding);
		}
		
		response.setCharacterEncoding(encoding);
	}
}
