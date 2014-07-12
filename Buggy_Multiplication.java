/*This program is a simple function that demonstrates
  the structuring of a non-scripting programming language
  such as Java...this time, I've incorporated a bug into the code
*/ 
public class Buggy_Multiplication  {
   public static void main(String[] args)  {
      int z;  //Create a variable for the answer
      
      z = 1 / 0;  //Perform the arithmetic 
      
      System.out.println("This is a demonstration of a non-scripting programming language.");
      System.out.print(z);  //Output the answer
   }
}

/*As you may have noticed, the program compiles without a hitch.
  When the program is executed though, a runtime error occurs.
  In order to fix this error, you have to go back into the code,
  find the error, fix it, recompile the code, and run it again.
  Think about having to do this in a very large application. It
  can become very tedious to say the least!!!
*/ 