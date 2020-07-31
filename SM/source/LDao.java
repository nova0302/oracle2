package com.javalec.ex.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//import java.sql.ResultSet;
//import java.util.ArrayList;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.ex.dto.LBDto;
import com.javalec.ex.dto.LDto;
import com.javalec.ex.dto.LMDto;

public class LDao {
	DataSource dataSource;
	public LDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public void bRegister(String bName, String type) {
		// TODO Auto-generated method stub
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "insert into tb_book values (seq_book.NEXTVAL, ?, ?)";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, bName);
			preparedStatement.setString(2, type);
			
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
	}
	
	public void mRegister(String mName, String phone) {
		// TODO Auto-generated method stub
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "insert into tb_member values (seq_member.NEXTVAL, ?, ?)";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, mName);
			preparedStatement.setString(2, phone);
			
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
	}

	public ArrayList<LMDto> mList(){
		ArrayList<LMDto> dtos = new ArrayList<LMDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		
		/*DBCP로부터 Connection을 얻고, 데이터베이스와 관련된 필요한 작어블 시작한다.*/
		try {
			connection = dataSource.getConnection();
			
			String query = "SELECT * FROM tb_member";
			preparedStatement = connection.prepareStatement(query);
			rs = preparedStatement.executeQuery();
			System.out.println("DAO");
			while (rs.next()) {
				String mCode = rs.getString("mcode");
				String mName = rs.getString("name");
				String mTel = rs.getString("tel");
				LMDto dto = new LMDto(mCode, mName, mTel);
				System.out.printf("mcode: %s, name: %s, tel: %s%n", mCode, mName,  mTel);
				dtos.add(dto);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return dtos;
	}
	
	public ArrayList<LBDto> bList(){
		ArrayList<LBDto> dtos = new ArrayList<LBDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		
		/*DBCP로부터 Connection을 얻고, 데이터베이스와 관련된 필요한 작어블 시작한다.*/
		try {
			connection = dataSource.getConnection();
			
			String query = "SELECT * FROM tb_book";
			preparedStatement = connection.prepareStatement(query);
			rs = preparedStatement.executeQuery();
			System.out.println("DAO");
			while (rs.next()) {
				String bCode = rs.getString(1);
				String bName = rs.getString(2);
				String Type = rs.getString(3);
				
				LBDto dto = new LBDto(bCode, bName, Type);
				//System.out.printf("name: %15s, tel: %s%n", mName,  mTel);
				dtos.add(dto);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return dtos;
	}

	public ArrayList<LDto> bStatus(int sel){
		ArrayList<LDto> dtos = new ArrayList<LDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String query = null;
		if(0 == sel)  		query = "SELECT * FROM vbStatus";
		else if(1 == sel) 	query = "SELECT * FROM vbStatusB";
		else 				query = "SELECT * FROM vbStatusR";
		/*DBCP로부터 Connection을 얻고, 데이터베이스와 관련된 필요한 작어블 시작한다.*/
		try {
			connection = dataSource.getConnection();
			preparedStatement = connection.prepareStatement(query);
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				String nRent = rs.getString("nRent");
				String bName = rs.getString("책이름");
				String bType = rs.getString("책장르");
				String isRented = rs.getString("대여상태");
				String rDate = rs.getString("대여날짜");
				String mName = rs.getString("대여회원");
				String Rent = rs.getString("반납/대여");
				System.out.printf("nRent: %s, bName: %10s, Jarn: %10s, isRented: %s, rDate: %10s, mName: %10s, Rent: %s%n", 
						nRent, bName, bType, isRented, rDate, mName, Rent);
				LDto dto = new LDto(nRent, bName, bType, isRented, rDate, mName, Rent);
				dtos.add(dto);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return dtos;
	}	
	
	public ArrayList<LDto> bSearch(String bName, String bType, String mName){
		ArrayList<LDto> dtos = new ArrayList<LDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		
		/*DBCP로부터 Connection을 얻고, 데이터베이스와 관련된 필요한 작어블 시작한다.*/
		try {
			connection = dataSource.getConnection();
			String query = "SELECT * FROM vbStatus v WHERE ";
			if(bName != null && bName != "") query += " v.\"책이름\"=" + "'"+ bName+ "'";
			if(bType != null && bType != "") query += " v.\"책장르\"=" + "'"+ bType+ "'";
			if(mName != null && mName != "") query += " v.\"대여회원\"=" + "'"+ mName+ "'";
			System.out.println(query);
			preparedStatement = connection.prepareStatement(query);		
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				String nRent = rs.getString("nRent");
				String bbName = rs.getString("책이름");
				String bbType = rs.getString("책장르");
				String isRented = rs.getString("대여상태");
				String rDate = rs.getString("대여날짜");
				String mmName = rs.getString("대여회원");
				String Rent = rs.getString("반납/대여");
				System.out.printf("nRent: %s, bName: %10s, Jarn: %10s, isRented: %s, rDate: %10s, mName: %10s, Rent: %s%n", 
						nRent, bbName, bbType, isRented, rDate, mmName, Rent);
				LDto dto = new LDto(nRent, bbName, bbType, isRented, rDate, mmName, Rent);
				dtos.add(dto);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return dtos;
	}

	public void bReturnTheBook(String nRent) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "DELETE FROM tb_rent WHERE nRent='"+nRent+"'";
			preparedStatement = connection.prepareStatement(query);
			//preparedStatement.setString(1, nRent);	
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public void rentTheBook(String bCode, String mCode) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "INSERT INOT tb_rent VALUES(seq_rent.NEXTVAL,?,?)";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, bCode);
			preparedStatement.setString(2, mCode);	
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
}