package edu.smh.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import edu.smh.dto.HelloDto;
import edu.smh.dto.SRecordDto;
import edu.smh.dto.SaleListDto;
import edu.smh.dto.SaleRecordDto;
import edu.smh.dto.WorldDto;

public class HelloWorldDao {
	DataSource dataSource;
	public HelloWorldDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public ArrayList<HelloDto> hList() {
		ArrayList<HelloDto> dtos = new ArrayList<HelloDto>();
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			connection = dataSource.getConnection();
			String query = "SELECT name, id FROM student";
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery();
			System.out.println("DAO:hList");
			while (rs.next()) {
				String name = rs.getString("name");
				String id = rs.getString("id");
				dtos.add(new HelloDto(name, id));

			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		} finally {
			try {
				if (ps != null) {
					ps.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return dtos;
	}

	public ArrayList<WorldDto> wList() {
		ArrayList<WorldDto> dtos = new ArrayList<WorldDto>();
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			connection = dataSource.getConnection();
			String query = "SELECT name, tel FROM student";
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery(query);
			System.out.println("DAO:hList");
			while (rs.next()) {
				String name = rs.getString("name");
				String tel = rs.getString("tel");
				dtos.add(new WorldDto(name, tel));

			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		} finally {
			try {
				if (ps != null) {
					ps.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return dtos;
	}

	public ArrayList<SaleListDto> sList() {
		ArrayList<SaleListDto> dtos = new ArrayList<SaleListDto>();
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			connection = dataSource.getConnection();
			String query = "SELECT saleno, pcode, to_char(saledate, 'yyyy-mm-dd') saledate,"
					+ "scode, amount FROM tbl_salelist_01";
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery(query);
			System.out.println("DAO:hList");
			while (rs.next()) {
				String saleno = rs.getString("saleno");
				String pcode = rs.getString("pcode");
				String saledate = rs.getString("saledate");
				String scode = rs.getString("scode");
				String amount = rs.getString("amount");

				dtos.add(new SaleListDto(saleno, pcode, saledate, scode, amount));

			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		} finally {
			try {
				if (ps != null) {
					ps.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return dtos;
	}
	
	
	public void saveRecord(SaleRecordDto dto) {
		Connection connection = null;
		PreparedStatement ps = null;
		int saleNo = Integer.parseInt(dto.getSaleNo());
		String pCode = dto.getPCode();
		String saleDate = dto.getSaleDate();
		String sCode = dto.getSCode();
		int amount = Integer.parseInt(dto.getAmount());
		
		System.out.println("saveRecord : " + saleNo + ", " 
				+ pCode +", " 
				+ saleDate + ", " 
				+ sCode +", " 
				+ amount);
		try {
			System.out.println("DAO:saveRecord");
			connection = dataSource.getConnection();

			String query = "INSERT INTO tbl_salelist_01 VALUES(?, ?, ?, ?, ?)";
			ps = connection.prepareStatement(query);
			ps.setInt(1, saleNo);
			ps.setString(2, pCode);

			ps.setDate(3, Date.valueOf("2020-11-27")); /// << ----
			ps.setString(4, sCode);
			ps.setInt(5, amount);

			int rn = ps.executeUpdate();
			System.out.println("DAO:saveRecord");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null) { ps.close(); }
				if (connection != null) { connection.close(); }
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	public SRecordDto gList() {
		String saleno = null;
		ArrayList<String> pcList = new ArrayList<String>();
		ArrayList<String> scList = new ArrayList<String>();

		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			connection = dataSource.getConnection();
			String query = "select max(saleno)+1 saleno "
					+ "from tbl_salelist_01";
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery(query);
			System.out.println("DAO:hList");

			rs.next();
			saleno = rs.getString("saleno");

			ps.close();
			query = "select pcode from tbl_product_01";
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery(query);
			while (rs.next()) {
				pcList.add(rs.getString("pcode"));
			}

			ps.close();
			query = "select scode from tbl_shop_01";
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery(query);
			while (rs.next()) {
				scList.add(rs.getString("scode"));
			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				if (ps != null) {
					ps.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		System.out.println("test: ");
		SRecordDto dto = new SRecordDto(saleno, pcList, scList);
		display(scList);
		return dto;
	}

	public static void display(ArrayList<String> languages) {

		System.out.print("ArrayList: ");
		for (String language : languages) {
			System.out.print(language + ", ");
		}
	}

}
