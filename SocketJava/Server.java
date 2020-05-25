      
    import java.io.BufferedInputStream;
    import java.io.DataInputStream;
    import java.io.IOException;
    import java.net.ServerSocket;
    import java.net.Socket;
    
    public class Server {
    
        private int port = 8888;
        private Socket socket = null;
        private ServerSocket serverSocket = null;
        private BufferedInputStream bis = null;
        private DataInputStream dis = null;
    
        public Server() {
        try {
	//creo il server e aspetto l'arrivo di un client
            serverSocket = new ServerSocket(port);
            System.out.println("Server started on port " + serverSocket.getLocalPort() + "...");
            System.out.println("Waiting for client...");

            socket = serverSocket.accept();
            System.out.println("Client " + socket.getRemoteSocketAddress() + " connected to server...");
            bis = new BufferedInputStream(socket.getInputStream());
            dis = new DataInputStream(bis);

            while (true) {
                try {
		//leggo i messaggi inviati dal client, se il messaggio è 'exit' esco
                    String messageFromClient = dis.readUTF();
                    if (messageFromClient.equals("exit")) {
                        break;
                    }
                    System.out.println("Client [" + socket.getRemoteSocketAddress() + "] : " + messageFromClient);
                } catch (IOException e) {
                    break;
                }
            }
	//chiudo il collegamento
            dis.close();
            socket.close();
            System.out.println("Client " + socket.getRemoteSocketAddress() + " disconnect from server...");
        } catch (IOException e) {
            System.out.println("Error : " + e);
        }
    }

    public static void main(String args[]) {
        Server server = new Server();
    }
}