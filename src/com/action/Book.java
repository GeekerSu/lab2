package com.action;

public class Book {
	private String ISBN;
	private String title;
	private String publisher;
	private String publishDate;
	private String price;
	private String authorID;

	public String getISBN() {
		return ISBN;
	}

	public void setISBN(String ISBN) {
		this.ISBN = ISBN;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String Publisher) {
		this.publisher = Publisher;
	}

	public String getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(String PublishDate) {
		this.publishDate = PublishDate;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String Price) {
		this.price = Price;
	}

	public String getAuthorID() {
		return authorID;
	}

	public void setAuthorID(String AuthorID) {
		this.authorID = AuthorID;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String Title) {
		this.title = Title;
	}
}
