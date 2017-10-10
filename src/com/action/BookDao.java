package com.action;

import java.sql.*;
//import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class BookDao {
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

	public List<Book> showAllBooks() throws Exception {
		List<Book> list = new ArrayList<>();
		Book book;
		Connection conn = getConn();
		try {
			Statement statement = conn.createStatement();
			String sql = "SELECT * FROM Book";
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				book = new Book();
				book.setISBN(rs.getString(1));
				book.setTitle(rs.getString(2));
				book.setPublisher(rs.getString(3));
				book.setPublishDate(rs.getString(4));
				book.setPrice(rs.getString(5));
				book.setAuthorID(rs.getString(6));
				list.add(book);
			}
			rs.close();
			statement.close();
		} catch (Exception e) {
			throw new Exception("查询所有图书出现错误");
		}
		conn.close();
		return list;
	}

	public void deleteBook(String ISBN) throws Exception {
		Connection conn = getConn();
		try {

			String sql0 = "DELETE FROM Book WHERE ISBN = '" + ISBN + "'";
			PreparedStatement ps0 = conn.prepareStatement(sql0);
			ps0.executeUpdate();
			ps0.close();

		}

		catch (Exception e) {
			throw new Exception("删除图书出现错误");
		}
		conn.close();
	}

	public List<Book> searchOnesBooks(String Name) throws Exception {
		List<Book> list = new ArrayList<>();
		Book book;
		Connection conn = getConn();
		try {
			Statement statement = conn.createStatement();
			String sql = "SELECT * FROM Author WHERE Name='" + Name + "'";
			ResultSet rsAuthorid = statement.executeQuery(sql);
			while (rsAuthorid.next()) {
				Statement statement1 = conn.createStatement();
				String sql1 = "SELECT * FROM Book WHERE AuthorID='" + rsAuthorid.getString(1) + "'";
				ResultSet rsBook = statement1.executeQuery(sql1);

				while (rsBook.next()) {
					book = new Book();
					book.setISBN(rsBook.getString(1));
					book.setTitle(rsBook.getString(2));
					book.setPublisher(rsBook.getString(3));
					book.setPublishDate(rsBook.getString(4));
					book.setPrice(rsBook.getString(5));
					book.setAuthorID(rsBook.getString(6));
					list.add(book);
				}
				rsBook.close();
				statement1.close();
			}
			rsAuthorid.close();
			statement.close();
		} catch (Exception e) {
			throw new Exception("查询某某的全部图书出现错误");
		}
		conn.close();
		return list;
	}
	
	public List<Book> searchOnesBooksJudge(String AuthorID) throws Exception {
		List<Book> list = new ArrayList<>();
		Book book;
		Connection conn = getConn();
		try {
			Statement statement = conn.createStatement();
			String sql = "SELECT * FROM Author WHERE AuthorID='" + AuthorID + "'";
			ResultSet rsAuthorid = statement.executeQuery(sql);
			while (rsAuthorid.next()) {
				Statement statement1 = conn.createStatement();
				String sql1 = "SELECT * FROM Book WHERE AuthorID='" + rsAuthorid.getString(1) + "'";
				ResultSet rsBook = statement1.executeQuery(sql1);

				while (rsBook.next()) {
					book = new Book();
					book.setISBN(rsBook.getString(1));
					book.setTitle(rsBook.getString(2));
					book.setPublisher(rsBook.getString(3));
					book.setPublishDate(rsBook.getString(4));
					book.setPrice(rsBook.getString(5));
					book.setAuthorID(rsBook.getString(6));
					list.add(book);
				}
				rsBook.close();
				statement1.close();
			}
			rsAuthorid.close();
			statement.close();
		} catch (Exception e) {
			throw new Exception("查询某某的全部图书判断出现错误");
		}
		conn.close();
		return list;
	}
	
	public List<Book> showOnesBooks(String ISBN) throws Exception {
		List<Book> list = new ArrayList<>();
		Book book;
		Connection conn = getConn();
		try {

			Statement statement1 = conn.createStatement();
			String sql1 = "SELECT * FROM Book WHERE ISBN='" + ISBN + "'";
			ResultSet rsBook = statement1.executeQuery(sql1);

			while (rsBook.next()) {
				book = new Book();
				book.setISBN(rsBook.getString(1));
				book.setTitle(rsBook.getString(2));
				book.setPublisher(rsBook.getString(3));
				book.setPublishDate(rsBook.getString(4));
				book.setPrice(rsBook.getString(5));
				book.setAuthorID(rsBook.getString(6));
				list.add(book);
			}
			rsBook.close();
			statement1.close();

		} catch (Exception e) {
			throw new Exception("查询某某的图书详细信息出现错误");
		}
		conn.close();
		return list;
	}

	public void updateBookInfo(String ISBN, String Title, String Publisher, String PublishDate, String Price,
			String AuthorID) throws Exception {
		Connection conn = getConn();
		try {
			Statement statement = conn.createStatement();
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd ");  
//		    java.util.Date date = sdf.parse(PublishDate);
//		    java.sql.Date d = new java.sql.Date(date.getTime());
			String sql = "update Book set ISBN='" + ISBN + "',Title='" + Title + "',Publisher='" + Publisher
					+ "',PublishDate='" + PublishDate + "',Price='" + Price + "',AuthorID='" + AuthorID
					+ "' where ISBN='" + ISBN + "'";
			statement.executeUpdate(sql);
			statement.close();
		} catch (Exception e) {
			throw new Exception("更新图书信息出现错误");
		}
		conn.close();

	}

	public String AddABook(String ISBN, String Title, String Publisher, String PublishDate, String Price,
			String AuthorID) throws Exception {
		Connection conn = getConn();
		String judgement = "success";
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd ");  
//	    java.util.Date date = sdf.parse(PublishDate);
//	    java.sql.Date d = new java.sql.Date(date.getTime());
		if (ISBN.equals("") || Title.equals("") || Publisher.equals("") || PublishDate.equals("") || Price.equals(""))
			judgement = "nullinfo";
		if (!judgement.equals("nullinfo")) {
			try {
				Statement statement1 = conn.createStatement();
				String sql = "SELECT * FROM Book";
				ResultSet rs = statement1.executeQuery(sql);
				while (rs.next()) {
					if (rs.getString(1).equals(ISBN)) {
						judgement = "error";
					}
				}
				if (judgement.equals("success")) {
					Statement statement2 = conn.createStatement();
					String sql2 = "insert into Book (ISBN,Title,Publisher,PublishDate,Price,AuthorID) values('" + ISBN
							+ "','" + Title + "','" + Publisher + "','" + PublishDate + "','" + Price + "','" + AuthorID
							+ "')";
					statement2.executeUpdate(sql2);
					statement2.close();
				}
				statement1.close();
			} catch (Exception e) {
				throw new Exception("新增图书出现错误");
			}
		}
		conn.close();
		return judgement;
	}
}
