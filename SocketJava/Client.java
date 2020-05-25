import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.util.Scanner;

public class Client {

    private String serverName = "localhost";
    private int serverPort = 8888;
    private Socket socket = null;
    private DataOutputStream out = null;

    public Client() {
        try {           
	//creo il client e mi connetto al server
            socket = new Socket(serverName, serverPort);
            System.out.println("Client started on port " + socket.getLocalPort()+"...");
            System.out.println("Connesso al server " + socket.getRemoteSocketAddress());
                        
	//creo stream di output
            out = new DataOutputStream(socket.getOutputStream());
            
	//oggetto di classe scanner per inserimento messaggi
            Scanner in = new Scanner(System.in);
            
            while (true) {
                try {
		//leggo il messaggio inserito e lo scrivo nel buffer di output dal quale verrà letto dal server
                    System.out.print("Inserisci il messaggio (exit per uscire): ");
                    String messageToServer = in.nextLine();
                    if(messageToServer.equals("exit")){
                        break;
                    }
                    out.writeUTF(messageToServer);
                    out.flush();
                } catch (IOException e) {
                    break;
                }
            }
	//chiudo collegamento con il server
            out.close();
            socket.close();
        } catch (IOException e) {
            System.out.println("Error : " + e.getMessage());
        }
    }   
    
    public static void main(String args[])
    {
        Client client = new Client();
    }
}