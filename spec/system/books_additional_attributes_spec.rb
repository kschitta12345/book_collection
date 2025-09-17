require "rails_helper"

RSpec.describe "Books (new attributes)", type: :system do
  it "creates a book with author, price, and published_date (sunny day)" do
    visit new_book_path

    fill_in "Title",  with: "You Don't Know JS"
    fill_in "Author", with: "Kyle Simpson"
    fill_in "Price",  with: "29.00"

    select "2025",     from: "book_published_date_1i"
    select "September",from: "book_published_date_2i"
    select "12",       from: "book_published_date_3i"

    click_button "Create Book"

    expect(page).to have_content("Book was successfully created.")
    expect(page).to have_content("You Don't Know JS")
    expect(page).to have_content("Kyle Simpson")
    expect(page).to have_content("$29.00")
    expect(page).to have_content("2025-09-12")
  end

  it "shows an error when author is blank (rainy day)" do
    visit new_book_path

    fill_in "Title", with: "No Author Book"
    fill_in "Price", with: "10.00"

    select "2025",     from: "book_published_date_1i"
    select "September",from: "book_published_date_2i"
    select "12",       from: "book_published_date_3i"

    click_button "Create Book"

    expect(page).to have_content("Author can't be blank")
  end

  it "shows an error when price is not a number (rainy day)" do
    visit new_book_path

    fill_in "Title",  with: "Bad Price"
    fill_in "Author", with: "Alex"
    fill_in "Price",  with: "abc"

    select "2025",     from: "book_published_date_1i"
    select "September",from: "book_published_date_2i"
    select "12",       from: "book_published_date_3i"

    click_button "Create Book"

    expect(page).to have_content("Price is not a number")
  end

  it "shows an error when published date is missing (rainy day)" do
    visit new_book_path

    fill_in "Title",  with: "No Date"
    fill_in "Author", with: "Chris"
    fill_in "Price",  with: "9.99"

    click_button "Create Book"

    expect(page).to have_content("Published date can't be blank")
  end
end

