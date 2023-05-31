package project_201844018;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class DeptDAO {
	String strDriver = "com.mysql.jdbc.Driver";
    String strUrl = "jdbc:mysql://localhost:3306/jspProject";
    String root = "root";
    String password = "dkswoals1";
    
    Connection conn;
    Statement stmt;
    ResultSet rs;
    PreparedStatement pstmt;
    
    String sql = null;
    
    public DeptDAO() {
        try{
            Class.forName(strDriver);
            conn = DriverManager.getConnection(strUrl, root, password);
            stmt = conn.createStatement();
        }catch(Exception e){
            System.out.println("SQL Exception : "+e.getMessage()+"| 데이터베이스 연결에러");
        }
    }
    
    public ArrayList<String> getDept(){
        sql = "select dept_name from dept";
        ArrayList<String> dept = new ArrayList<>();
        try{
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            while(rs.next()){
                dept.add(rs.getString("dept_name"));
                }
            return dept;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
