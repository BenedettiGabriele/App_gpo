import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class TestJunit {
	
   String message = "Hello World";	
   MessageUtil messageUtil = new MessageUtil("Hello World");

   @Test
   public void testPrintMessage() {
      assertEquals(message,messageUtil.printMessage());
   }
}