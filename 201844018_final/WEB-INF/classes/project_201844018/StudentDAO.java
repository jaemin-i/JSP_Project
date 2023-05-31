package project_201844018;

import java.sql.*;

public class StudentDAO {
    String strDriver = "com.mysql.jdbc.Driver";
    String strUrl = "jdbc:mysql://localhost:3306/jspProject";
    String root = "root";
    String password = "dkswoals1";
    
    Connection conn;
    Statement stmt;
    ResultSet rs;
    PreparedStatement pstmt;
    
    String sql = null;
    
    public StudentDAO() {
        try{
            Class.forName(strDriver);
            conn = DriverManager.getConnection(strUrl, root, password);
            stmt = conn.createStatement();
        }catch(Exception e){
            System.out.println("SQL Exception : "+e.getMessage()+"| 데이터베이스 연결에러");
        }
    }
    
    public StudentVO findStuno(StudentVO vo) {
    	sql = "select stu_no from student where stu_name = ? and stu_hp = ? and stu_birth = ?";
    	try {
    	pstmt = conn.prepareStatement(sql);
    	pstmt.setString(1, vo.getStu_name());
    	pstmt.setString(2, vo.getStu_hp());
    	pstmt.setString(3, vo.getStu_birth());
    	rs = pstmt.executeQuery();
    	if (rs.next()) {
    		vo.setStu_no(rs.getInt("Stu_no"));
    	}
    	return vo;
    	}catch(Exception e){
            System.out.println("SQL Exception : "+e.getMessage()+"| DB검색 에러");
            return null;
        }
    }
    
    public StudentVO findStupw(StudentVO vo) {
    	sql = "select AES_DECRYPT(unhex(stu_pw), 'a') as stu_pw from student where stu_no = ? and stu_hp = ? and stu_birth = ?";
    	try {
    	pstmt = conn.prepareStatement(sql);
    	pstmt.setInt(1, vo.getStu_no());
    	pstmt.setString(2, vo.getStu_hp());
    	pstmt.setString(3, vo.getStu_birth());
    	rs = pstmt.executeQuery();
    	if (rs.next()) {
    		vo.setStu_pw(rs.getString("Stu_pw"));
    	}
    	return vo;
    	}catch(Exception e){
            System.out.println("SQL Exception : "+e.getMessage()+"| DB검색 에러");
            return null;
        }
    }
    
    public StudentVO login(StudentVO vo) {
    	sql = "select stu_name, stu_no, AES_DECRYPT(unhex(stu_pw), 'a') as stu_pw, stu_hp, stu_dept from student where stu_no = ? and stu_pw = hex(aes_encrypt(?,'a'))";
    	try {
    	pstmt = conn.prepareStatement(sql);
    	pstmt.setInt(1, vo.getStu_no());
    	pstmt.setString(2, vo.getStu_pw());
    	rs = pstmt.executeQuery();
    	if(rs.next()) {
    		vo.setStu_name(rs.getString("Stu_name"));
    		vo.setStu_no(rs.getInt("Stu_no"));
    		vo.setStu_pw(rs.getString("Stu_pw"));
    		vo.setStu_hp(rs.getString("Stu_hp"));
    		vo.setStu_dept(rs.getString("Stu_dept"));
    		return vo;
    	}else {
    		return null;
    	}
    	}catch(Exception e){
            System.out.println("SQL Exception : "+e.getMessage()+"| DB검색 에러");
            return null;
        }
    }
    
    public StudentVO stuInfo(StudentVO vo) {
    	sql = "select * from student where stu_no = ?";
    	try {
    	pstmt = conn.prepareStatement(sql);
    	pstmt.setInt(1, vo.getStu_no());
    	rs = pstmt.executeQuery();
    	if(rs.next()) {
    		vo.setStu_grade(rs.getInt("Stu_grade"));
    		vo.setStu_dept(rs.getString("Stu_dept"));
    		vo.setStu_hp(rs.getString("Stu_hp"));
    		vo.setStu_birth(rs.getString("Stu_birth"));
    		return vo;
    	}else {
    		return null;
    	}
    	}catch(Exception e){
            System.out.println("SQL Exception : "+e.getMessage()+"| DB검색 에러");
            return null;
        }
    }
    
    public int updateMemInfo(StudentVO vo) {
    	int result = 0;
    	sql = "update student set stu_pw = hex(aes_encrypt(?,'a')), stu_name = ?, stu_hp = ?, stu_dept = ? where stu_no = ?";
    	try {
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, vo.getStu_pw());
    		pstmt.setString(2, vo.getStu_name());
    		pstmt.setString(3, vo.getStu_hp());
    		pstmt.setString(4, vo.getStu_dept());
    		pstmt.setInt(5, vo.getStu_no());
    		result = pstmt.executeUpdate();
    		return result;
    	}catch(Exception e){
            System.out.println("SQL Exception : "+e.getMessage()+"| DB검색 에러");
            return 0;
        }
    }
}