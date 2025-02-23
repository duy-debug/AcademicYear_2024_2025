import java.io.*;
class WriteIntsBuffered
{
 public static void main ( String[] args )
 {
   String fileName = "intData2.dat" ;

   try
   {      
     DataOutputStream out = new DataOutputStream(
         new BufferedOutputStream(
         new FileOutputStream( fileName )));

     for ( int j=0; j<512; j++ )
       out.writeInt( j );  

     out.close();
   }
   catch ( IOException iox )
   {
     System.out.println("Problem writing " + fileName );
   }
 }
}
