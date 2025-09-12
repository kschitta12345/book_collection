require "rails_helper"

RSpec.describe "Books", type: :system do
  it "creates a book successfully and shows a successful flash" do
    visit new_book_path

    fill_in "Title",  with: "My First Book"
    fill_in "Author", with: "Jane Doe"
    fill_in "Price",  with: "29.00"

    # date_select generates 3 selects with predictable IDs
    select "2025",    from: "book_published_date_1i" # year
    select "September", from: "book_published_date_2i" # month
    select "12",      from: "book_published_date_3i" # day

    click_button "Create Book"

    expect(page).to have_content("Book was successfully created.")
    expect(page).to have_content("My First Book")
  end
end

