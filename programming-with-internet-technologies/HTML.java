public class HTML 

{
import java.io.BufferedReader;  
import java.io.FileReader;  
import java.io.IOException;  

public class Main 
{
  public static void main(String[] args) 
  {  
    String line = "";
   
	try 
	{  
            BufferedReader br = new BufferedReader(new FileReader(args[0]));  
			
            System.out.println("<html>")
            System.out.println("	<head>")
            System.out.println("		<title>HTML Output</title>")
            System.out.println("	</head>")
            System.out.println("		<body>")
            System.out.println("			<tables>")
  
            while ((line = br.readLine()) != null) 
		{
                    String[] strTokens = line.split(",");
        
			for(int i = 0; i < strTokens.length; i++) 
                    {
			System.out.println("Token #" + (i + 1) + " : " + strTokens[i]);
                    }
        
        System.out.println();
		}
	} 
            catch (IOException e) 
		{
                    e.printStackTrace();  
		}
			
            System.out.println("			</tables>")
            System.out.println("		</body>")
            System.out.println("</html>")
  }  
}    
}
