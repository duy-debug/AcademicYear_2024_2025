 import java.io.*;
 import java.net.*;
 import java.util.*;

 /**
 This program connects to an URL and displays the
 response header data and the first 10 lines of the
 requested data.
 */
public class URLConnectionTest {
   public static void main(String[] args){
      try
      {
	   String urlName;
	   if (args.length > 0)
	        urlName = args[0];
	   else	urlName = "http://java.sun.com";

           URL url = new URL(urlName);
           URLConnection connection = url.openConnection();

	  connection.connect();

          // print header fields

	 int n = 1;
 	 String key;
	 while ((key = connection.getHeaderFieldKey(n)) != null)
	 {
		 String value = connection.getHeaderField(n);
		 System.out.println(key + ": " + value);
		 n++;
	 }

	 // print convenience functions

	System.out.println("----------");
	System.out.println("getContentType: "
	+ connection.getContentType());
	System.out.println("getContentLength: "
	+ connection.getContentLength());
	System.out.println("getContentEncoding:"
	+ connection.getContentEncoding());
	System.out.println("getDate: "
	+ connection.getDate());
	System.out.println("getExpiration: "
	+ connection.getExpiration());
	System.out.println("getLastModifed: "
	+ connection.getLastModified());
	System.out.println("----------");


	BufferedReader in = new BufferedReader(new
	InputStreamReader(connection.getInputStream()));

	// print first ten lines of contents

	String line;
	n = 1;
	while ((line = in.readLine()) != null && n <= 10)
	{
		System.out.println(line);
		n++;
	}
	if (line != null) System.out.println(". . .");
    }
    catch (IOException exception)
	{
		exception.printStackTrace();
	}
  }  

}

