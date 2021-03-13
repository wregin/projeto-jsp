package connection;
/**
 * Responsável por fazer conexao ao banco
 * @author mintdev
 *
 */

import java.sql.Connection;
import java.sql.DriverManager;


public class SingleConnection {

	private static String banco = "jdbc:postgresql://localhost:5432/curso-jsp?autoReconnect=true";
	private static String password = "Admin";
	private static String user = "postgres";
	private static Connection connection = null;
	
	static {
		conectar();
	}
	
	public SingleConnection() {
		conectar();
	}
	
	private static void conectar() {
		try {
			
			if (connection == null) {
				Class.forName("org.postgresql.Driver");
				connection = DriverManager.getConnection(banco, user, password);
				connection.setAutoCommit(false);
				System.out.println("opa conectou!");
			}
			
		} catch (Exception e) {
			throw new RuntimeException("Erro ao conectar com o banco!!!");
		}
	}
	
	public static Connection getConnection() {
		return connection;
	}
	
}
