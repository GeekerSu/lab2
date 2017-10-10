package com.action;

import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

public class JDBCOperation extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String errorMsg="";
	
	public String getErrorMsg() { return errorMsg; }

	public String showAllBooks() {
		try {
			HttpSession session = ServletActionContext.getRequest().getSession();
			session.setAttribute("bookList", new BookDao().showAllBooks());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "showAllBooks";
	}
	
	public String showAllAuthors() {
		try {
			HttpSession session = ServletActionContext.getRequest().getSession();
			session.setAttribute("authorList", new AuthorDao().showAllAuthors());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "showAllAuthors";
	}

	public String deleteBook() {
		try {
			String ISBN = ServletActionContext.getRequest().getParameter("ISBN");
			new BookDao().deleteBook(ISBN);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return showAllBooks();
	}
	
	public String deleteAuthor() {
		try {
			
			String AuthorID = ServletActionContext.getRequest().getParameter("AuthorID");
			System.out.println(AuthorID);
			System.out.println(new BookDao().searchOnesBooksJudge(AuthorID).isEmpty());
			if(new BookDao().searchOnesBooksJudge(AuthorID).isEmpty())
			new AuthorDao().deleteAuthor(AuthorID);
			else throw new Exception();
		} catch (Exception e) {
			e.printStackTrace();
			errorMsg+="该作者在库中有图书，无法删除";
			return "error";
		}
		return showAllAuthors();
	}

	public String searchOnesBooks() {
		try {
			HttpSession session = ServletActionContext.getRequest().getSession();
			String Name = ServletActionContext.getRequest().getParameter("Name");
			if(Name.equals(""))
				return "nullinfo";
			else{
			session.setAttribute("bookList", new BookDao().searchOnesBooks(Name));
			if(new BookDao().searchOnesBooks(Name).isEmpty())
				return "noBooks";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "searchOnesBooks";
	}

	public String showOnesBooks() {
		try {
			HttpSession session = ServletActionContext.getRequest().getSession();
			String ISBN = ServletActionContext.getRequest().getParameter("ISBN");
			session.setAttribute("bookList", new BookDao().showOnesBooks(ISBN));
			session.setAttribute("authorList", new AuthorDao().showAuthorDetial(ISBN));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "showOnesBooks";
	}

	public String updateBookInfoPr() {
		try {
			HttpSession session = ServletActionContext.getRequest().getSession();
			String ISBN = ServletActionContext.getRequest().getParameter("ISBN");
			session.setAttribute("bookList", new BookDao().showOnesBooks(ISBN));
			session.setAttribute("authorList", new AuthorDao().showAllAuthor(ISBN));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "updateBookInfoPr";
	}

	public String updateBookInfo() {
		try {
			String Title = ServletActionContext.getRequest().getParameter("Title");
			String Publisher = ServletActionContext.getRequest().getParameter("Publisher");
			String PublishDate = ServletActionContext.getRequest().getParameter("PublishDate");
			String Price = ServletActionContext.getRequest().getParameter("Price");
			String ISBN = ServletActionContext.getRequest().getParameter("ISBN");
			String AuthorID = ServletActionContext.getRequest().getParameter("AuthorID");
			new BookDao().updateBookInfo(ISBN, Title, Publisher, PublishDate, Price, AuthorID);
		} catch (Exception e) {
			e.printStackTrace();
			errorMsg+="更新图书数据出错";
			return "error";
		}
		return showAllBooks();
	}

	public String AddABookPr() {
		try {
			HttpSession session = ServletActionContext.getRequest().getSession();
			session.setAttribute("authorList", new AuthorDao().showAllAuthors());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "AddABookPr";
	}

	public String AddABook() {
		try {
			String Title = ServletActionContext.getRequest().getParameter("Title");
			String Publisher = ServletActionContext.getRequest().getParameter("Publisher");
			String PublishDate = ServletActionContext.getRequest().getParameter("PublishDate");
			String Price = ServletActionContext.getRequest().getParameter("Price");
			String ISBN = ServletActionContext.getRequest().getParameter("ISBN");
			String AuthorID = ServletActionContext.getRequest().getParameter("AuthorID");
			String judgement = new BookDao().AddABook(ISBN, Title, Publisher, PublishDate, Price, AuthorID);
			if (judgement.equals("success"))
				return showAllBooks();
			else if (judgement.equals("nullinfo"))
				return "nullinfo";
		} catch (Exception e) {
			e.printStackTrace();
			errorMsg+="新增图书出错";
		}
		return "errorISBN";
	}

	public String AddAnAuthor() {
		try {
			String AuthorID = ServletActionContext.getRequest().getParameter("AuthorID");
			String Name = ServletActionContext.getRequest().getParameter("Name");
			String Age = ServletActionContext.getRequest().getParameter("Age");
			String Country = ServletActionContext.getRequest().getParameter("Country");
			String judgement = new AuthorDao().AddAnAuthor(AuthorID, Name, Age, Country);
			if (judgement.equals("success"))
				return showAllAuthors();
			else if (judgement.equals("nullinfo"))
				return "nullinfo";
		} catch (Exception e) {
			e.printStackTrace();
			errorMsg+="添加作者出错";
		}
		return "errorAuthorID";
	}

}
