package com.action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AuthorDao {
	private static Connection getConn() {
		String driver = "com.mysql.jdbc.Driver";
//		String url = "jdbc:mysql://tjluphursqec.mysql.sae.sina.com.cn:10623/bookdb?useUnicode=true&characterEncoding=UTF-8&oldsyntax=true&zeroDateTimeBehavior=convertToNull";		
//		String username = "suzichao1996";
//		String password = "19961206";
		String url = "jdbc:mysql://localhost:3306/bookdb?useUnicode=true&characterEncoding=UTF-8&oldsyntax=true&zeroDateTimeBehavior=convertToNull";
		String username = "root";
		String password = "";
		Connection conn = null;
		try {
			Class.forName(driver); // classLoader,加载对应驱动
			conn = (Connection) DriverManager.getConnection(url, username, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	public List<Author> showAuthorDetial(String ISBN) throws Exception {
		List<Author> list = new ArrayList<>();
		Author author;
		Connection conn = getConn();
		try {
			Statement statement = conn.createStatement();
			String sql = "SELECT * FROM Book WHERE ISBN='" + ISBN + "'";
			ResultSet rsISBN = statement.executeQuery(sql);
			while (rsISBN.next()) {
				Statement statement1 = conn.createStatement();
				String sql1 = "SELECT * FROM Author WHERE AuthorID='" + rsISBN.getString(6) + "'";
				ResultSet rsAuthor = statement1.executeQuery(sql1);

				while (rsAuthor.next()) {
					author = new Author();
					author.setAuthorID(rsAuthor.getString(1));
					author.setName(rsAuthor.getString(2));
					author.setAge(rsAuthor.getString(3));
					author.setCountry(rsAuthor.getString(4));
					list.add(author);
				}
				rsAuthor.close();
				statement1.close();
			}
			rsISBN.close();
			statement.close();
		} catch (Exception e) {
			throw new Exception("查询作者详细信息出现错误");
		}
		conn.close();
		return list;
	}

	public List<Author> showAllAuthor(String ISBN) throws Exception {
		List<Author> list = new ArrayList<>();
		Author author;
		Connection conn = getConn();
		try {
			Statement statement = conn.createStatement();
			String sql = "SELECT * FROM Book WHERE ISBN='" + ISBN + "'";
			ResultSet rsISBN = statement.executeQuery(sql);
			rsISBN.next();
			Statement statement1 = conn.createStatement();
			String sql1 = "SELECT * FROM Author";
			ResultSet rsAuthor = statement1.executeQuery(sql1);

			while (rsAuthor.next()) {
				if(!rsAuthor.getString(1).equals(rsISBN.getString(6))){
				author = new Author();
				author.setAuthorID(rsAuthor.getString(1));
				author.setName(rsAuthor.getString(2));
				author.setAge(rsAuthor.getString(3));
				author.setCountry(rsAuthor.getString(4));
				list.add(author);
				}
			}
			rsAuthor.close();
			statement1.close();
			statement.close();
		} catch (Exception e) {
			throw new Exception("查询所有作者出现错误");
		}
		conn.close();
		return list;
	}

	
	public String AddAnAuthor(String AuthorID, String Name, String Age, String Country) throws Exception {
		Connection conn = getConn();
		String judgement = "success";
		if (AuthorID.equals("") || Name.equals("") || Age.equals("") || Country.equals(""))
			judgement = "nullinfo";
		if (!judgement.equals("nullinfo")) {
			try {
				Statement statement1 = conn.createStatement();
				String sql = "SELECT * FROM Author";
				ResultSet rs = statement1.executeQuery(sql);
				while (rs.next()) {
					if (rs.getString(1).equals(AuthorID)) {
						judgement = "error";
					}
				}
				if (judgement.equals("success")) {
					Statement statement = conn.createStatement();
					String sql2 = "insert into Author (AuthorID,Name,Age,Country) values('" + AuthorID + "','" + Name
							+ "','" + Age + "','" + Country + "')";
					statement.executeUpdate(sql2);
					statement.close();
				}
				statement1.close();
			} catch (Exception e) {
				throw new Exception("新增作者出现错误");
			}
		}
		conn.close();
		return judgement;
	}
		
	public List<Author> showAllAuthors() throws Exception {
		List<Author> list = new ArrayList<>();
		Author author;
		Connection conn = getConn();
		try {
			Statement statement = conn.createStatement();
			String sql = "SELECT * FROM Author";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				author = new Author();
				author.setAuthorID(rs.getString(1));
				author.setName(rs.getString(2));
				author.setAge(rs.getString(3));
				author.setCountry(rs.getString(4));
				list.add(author);
			}
			rs.close();
			statement.close();
		} catch (Exception e) {
			throw new Exception("查询所有作者出现错误");
		}
		conn.close();
		return list;
	}
	
	public void deleteAuthor(String AuthorID) throws Exception {
		Connection conn = getConn();
		try {

			String sql0 = "DELETE FROM Author WHERE AuthorID ='" + AuthorID + "'";
			PreparedStatement ps0 = conn.prepareStatement(sql0);
			ps0.executeUpdate();
			ps0.close();

		}

		catch (Exception e) {
			throw new Exception("删除作者出现错误");
		}
		conn.close();
	}
}
