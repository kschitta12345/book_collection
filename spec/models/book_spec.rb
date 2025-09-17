require "rails_helper"

RSpec.describe Book, type: :model do
  it "is valid with title, author, price, and published_date" do
    book = Book.new(
      title: "My Title",
      author: "Someone",
      price: 19.99,
      published_date: Date.new(2017, 9, 20)
    )
    expect(book).to be_valid
  end

  it "is invalid without a title" do
    book = Book.new(author: "A", price: 10, published_date: Date.today)
    expect(book).not_to be_valid
    expect(book.errors[:title]).to be_present
  end

  it "is invalid without an author" do
    book = Book.new(title: "X", price: 10, published_date: Date.today)
    expect(book).not_to be_valid
    expect(book.errors[:author]).to be_present
  end

  it "is invalid without a price" do
    book = Book.new(title: "X", author: "A", published_date: Date.today)
    expect(book).not_to be_valid
    expect(book.errors[:price]).to be_present
  end

  it "is invalid without a published_date" do
    book = Book.new(title: "X", author: "A", price: 10)
    expect(book).not_to be_valid
    expect(book.errors[:published_date]).to be_present
  end
end

