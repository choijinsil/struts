package com.encore.util;

public class Util {
	public static String toJS(String str) {//파라미터str:공백을 포함한 문자열
		System.out.println();
		return str.replace("\n", " ")
	              .replace("\r\n"," ")
	              .replace("\\", "\\\\")
	              .replace("\'", "\\\'")
	              .replace("\"", "\\\"");
	};

}
