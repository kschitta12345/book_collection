class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :published_date, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end
