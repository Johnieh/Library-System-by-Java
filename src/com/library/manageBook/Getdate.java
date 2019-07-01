package com.library.manageBook;

import java.util.*;
import java.text.*;
import java.util.Date;

public class Getdate {
	
   public static String getdate() {

	  java.util.Date dNow = new java.util.Date();
      SimpleDateFormat ft = new SimpleDateFormat ("yyyy.MM.dd");
      return ft.format(dNow).toString();
   }
}