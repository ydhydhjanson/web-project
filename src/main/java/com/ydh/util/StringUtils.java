package com.ydh.util;

public class StringUtils {
	public static boolean isNotBlank(String str) {
		if (str == null) {
			return false;
		} else {
			if (str.trim().equals("") || str.trim().equalsIgnoreCase("null")) {
				return false;
			} else {
				return true;
			}
		}
	}

}
