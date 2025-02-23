import java.io.*;
class Nhap {
//Cho qua ki?u ngo?i l? IOException l� l?i nh?p xu?t ph�t sinh khi th?c hi?n ph��ng th?c
//readLine() c?a l?p BufferedReader
public static void main (String[] args) throws IOException{
	BufferedReader kbd = new BufferedReader(new InputStreamReader (System.in));
	String s = null;
	// Nhap ho ten
	do {System.out.print("Nhap Ho va ten khong qua 25 ky tu: ");
		s = kbd.readLine();
	} while (s.length()>25 || s.length()==0);
	System.out.println("Ho va ten l� : "+s);
	// Nhap nam sinh trong doan 1980-1985
	while (true) {
		try {
			System.out.print("Nhap nam sinh : ");
			s = kbd.readLine();
			//Ph��ng th?c parseInt() c?a l?p Integer ph�t sinh l?i �?nh d?ng s? 
			int ns =Integer.parseInt(s);
			//�i?u ki?n ph�t sinh l?i �?nh d?ng s? NumberFormatException
			if (ns<1980 || ns>1985) throw new NumberFormatException();
			System.out.println("Nam sinh la : "+ns);
			break;
		}
		//B?t ki?u ngo?i l? NumberFormatException
		catch(NumberFormatException e){
			System.out.println("Ban nhap lai nam sinh tu 1980 -1985");
		}
	}
}
} 

