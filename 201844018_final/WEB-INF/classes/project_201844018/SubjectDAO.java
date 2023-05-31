package project_201844018;

import java.sql.*;
import java.util.ArrayList;

public class SubjectDAO {
	String strDriver = "com.mysql.jdbc.Driver";
    String strUrl = "jdbc:mysql://localhost:3306/jspProject";
    String root = "root";
    String password = "dkswoals1";
    
    String sql = null;
    
    Connection conn;
    Statement stmt;
    ResultSet rs;
    PreparedStatement pstmt;
    
    public SubjectDAO() {
        try{
            Class.forName(strDriver);
            conn = DriverManager.getConnection(strUrl, root, password);
            stmt = conn.createStatement();
        }catch(Exception e){
            System.out.println("SQL Exception : "+e.getMessage()+"| 데이터베이스 연결에러");
        }
    }
    
    public ArrayList<SubjectVO> getSubject(String studept){
        sql = "select * from subject where sub_dept in(?,'온라인','공통교양') order by sub_no, field(sub_dept, ?, '공통교양', '온라인')";
        ArrayList<SubjectVO> subject = new ArrayList<>();
        try{
        	pstmt = conn.prepareStatement(sql);
        	pstmt.setString(1, studept);
        	pstmt.setString(2, studept);
        	rs = pstmt.executeQuery();
            while(rs.next()){
            	SubjectVO sub = new SubjectVO();
            	sub.setSub_no(rs.getString("sub_no"));
            	sub.setSub_name(rs.getString("sub_name"));
            	sub.setSub_grade(rs.getInt("sub_grade"));
            	sub.setSub_dept(rs.getString("sub_dept"));
            	sub.setSub_personnel(rs.getInt("sub_personnel"));
            	sub.setSub_proposer(rs.getInt("sub_proposer"));
            	sub.setSub_score(rs.getInt("sub_score"));
            	subject.add(sub);
            }
            return subject;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    public int proUpdate(String subno) {
    	sql = "update subject set sub_proposer = sub_proposer + 1 where sub_no = ?";
    	int result = 0;
        try{
        	pstmt = conn.prepareStatement(sql);
        	pstmt.setString(1, subno);
        	result = pstmt.executeUpdate();
            return result;
        }catch(Exception e){
            e.printStackTrace();
            return -1;
        }
    }
    
    public int proDelete(String subno) {
    	sql = "update subject set sub_proposer = sub_proposer - 1 where sub_no = ?";
    	int result = 0;
        try{
        	pstmt = conn.prepareStatement(sql);
        	pstmt.setString(1, subno);
        	result = pstmt.executeUpdate();
            return result;
        }catch(Exception e){
            e.printStackTrace();
            return -1;
        }
    }
    
    public boolean chkPer(String subno) {
    	sql = "select sub_no from subject where sub_no = ? and sub_personnel <= sub_proposer";
        try{
        	pstmt = conn.prepareStatement(sql);
        	pstmt.setString(1, subno);
        	rs = pstmt.executeQuery();
            return rs.next();
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
    
    public String getSubName(String subno) {
    	sql = "select sub_name from subject where sub_no = ?";
    	String result = null;
        try{
        	pstmt = conn.prepareStatement(sql);
        	pstmt.setString(1, subno);
        	rs = pstmt.executeQuery();
            if(rs.next()) {
            	result = rs.getString("sub_name");
            }
           return result;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
