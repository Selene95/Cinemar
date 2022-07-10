import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Connection;

public class Conexion<stmt> {
	
	  Connection conn=null;
	  Statement stmt=null;
	  
	public Conexion() {
		   final String JDBC_DRIVER="com.mysql.jdbc.Driver";
		   final String DB_URL="jdbc:mysql://localhost:3306/bdcinemar";
	       final String USER="root";
		   final String PASS="pass";	
		   
    try {
    	Class.forName(JDBC_DRIVER);
    	System.out.println("Conectando a la base de datos...");
    	conn=DriverManager.getConnection(DB_URL,USER,PASS);
    	
        }catch(Exception e) {
             System.out.println("ERROR DE CONEXION");	
        }
    
	}
	
    public ResultSet devuelveConsulta(String sql) throws SQLException {
	 System.out.println("Creando la consulta...");
		stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		
		return rs;
 }
 
       public void Consulta(String sql) throws SQLException {
		
		System.out.println("Creando consulta...");
		stmt=conn.createStatement();
		stmt.executeUpdate(sql);	
		
	}
}