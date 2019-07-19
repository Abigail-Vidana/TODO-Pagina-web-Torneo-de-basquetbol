package mx.com.develop.model;


import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.*;
import javax.sql.DataSource;

public class Mbd{

   
	String consultaSQL  = null;
	Context ctx  = null;
	DataSource ds  = null;
	Connection conn  = null;

	ResultSet rst =  null;
	Statement stmt =  null;
	PreparedStatement ps =  null;
	CallableStatement ocs = null;
        
         public Mbd() throws NamingException{
             ctx = new InitialContext();
        }
         
	public void getConexion() throws NamingException, SQLException {
		ds = (DataSource)ctx.lookup("resourceTorneoBasquet");
		conn  = ds.getConnection();
	}

	public void getConexionMonex() throws NamingException, SQLException {
		ds = (DataSource)ctx.lookup("dcorp.DSDCorpTransaccional");
		conn  = ds.getConnection();
	}

	public void returnConexion (Connection conn, PreparedStatement ps, ResultSet rst,Statement stmt){
		try{
			if(rst!=null)
				rst.close();
			if(stmt!=null)
				stmt.close();
			if(ps!=null)
				ps.close();
			if(conn!=null && !conn.isClosed())
				conn.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}

	public void returnConexion (Connection conn, PreparedStatement ps, ResultSet rst,Statement stmt,CallableStatement ocs){
		try{
			if(rst!=null)
				rst.close();
			if(stmt!=null)
				stmt.close();
			if(ps!=null)
				ps.close();
			if(ocs!=null)
				ocs.close();
			if(conn!=null)
				conn.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
}

