package project_201844018;

import java.sql.*;
import java.util.ArrayList;

public class EnrolDAO {
	String strDriver = "com.mysql.jdbc.Driver";
    String strUrl = "jdbc:mysql://localhost:3306/jspProject";
    String root = "root";
    String password = "dkswoals1";
    
    Connection conn;
    Statement stmt;
    ResultSet rs;
    PreparedStatement pstmt;
    
    String sql = null;
    
    public EnrolDAO() {
        try{
            Class.forName(strDriver);
            conn = DriverManager.getConnection(strUrl, root, password);
            stmt = conn.createStatement();
        }catch(Exception e){
            System.out.println("SQL Exception : "+e.getMessage()+"| 데이터베이스 연결에러");
        }
    }
    public ArrayList<SubjectVO> getAppList(int stuno){
        sql = "select * from enrol natural join subject where stu_no = ?";
        ArrayList<SubjectVO> appList = new ArrayList<>();
        try{
        	pstmt = conn.prepareStatement(sql);
        	pstmt.setInt(1, stuno);
        	rs = pstmt.executeQuery();
            while(rs.next()){
            	SubjectVO app = new SubjectVO();
            	app.setSub_no(rs.getString("sub_no"));
            	app.setSub_score(rs.getInt("sub_score"));
            	app.setSub_name(rs.getString("sub_name"));
            	app.setSub_grade(rs.getInt("sub_grade"));
            	appList.add(app);
            }
            return appList;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    
    public int appInsert(EnrolVO vo){
        sql = "insert into enrol values(?, ?)";
        int result = 0;
        try{
        	pstmt = conn.prepareStatement(sql);
        	pstmt.setInt(1, vo.getStu_no());
        	pstmt.setString(2, vo.getSub_no());
        	result = pstmt.executeUpdate();
            return result;
        }catch(Exception e){
            e.printStackTrace();
            return -1;
        }
    }
    
    public int appDelete(EnrolVO vo){
        sql = "delete from enrol where sub_no = ? and stu_no = ?";
        int result = 0;
        try{
        	pstmt = conn.prepareStatement(sql);
        	pstmt.setString(1, vo.getSub_no());
        	pstmt.setInt(2, vo.getStu_no());
        	result = pstmt.executeUpdate();
            return result;
        }catch(Exception e){
            e.printStackTrace();
            return -1;
        }
    }
    
    public boolean chkSub(String subno, int stuno) {
    	sql = "select sub_name from enrol natural join subject where sub_no = ? and stu_no = ?";
        try{
        	pstmt = conn.prepareStatement(sql);
        	pstmt.setString(1, subno);
        	pstmt.setInt(2, stuno);
        	rs = pstmt.executeQuery();
            return rs.next();
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
    
 
}
