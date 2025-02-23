class Product < ApplicationRecord
  belongs_to :category
  validates :url, presence: true, uniqueness: true

  scope :filter_by_search, ->(query) {
    return all if query.blank?

    sanitized_query = "%#{query.gsub(/\s+/, '')}%"

    where(
      "REPLACE(title, ' ', '') LIKE :query OR
       REPLACE(description, ' ', '') LIKE :query OR
       REPLACE(CAST(price AS CHAR), ' ', '') LIKE :query OR
       REPLACE(url, ' ', '') LIKE :query",
      query: sanitized_query
    )
  }
end
