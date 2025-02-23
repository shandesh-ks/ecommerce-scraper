class ProductsController < ApplicationController

  def create
    url = params.require(:url)
    product_data = ScraperService.fetch_product_details(url)

    category = Category.find_or_create_by(name: product_data[:category] || 'default')
    product = Product.find_or_create_by(url: url, category_id: category.id)

    product.update_columns(
      title: product_data[:title],
      description: product_data[:description],
      price: product_data[:price],
      size: product_data[:size],
      available_offers: product_data[:available_offers],
      offer_percentage: product_data[:image_url],
      rating: product_data[:rating],
      specifications: product_data[:specifications],
      no_of_ratings: product_data[:no_of_ratings],
      no_of_reviews: product_data[:no_of_reviews],
      last_scraped_at: Time.current
    )

    if product.persisted?
      render json: product, status: :created
    else
      render json: { error: "Failed to save product" }, status: :unprocessable_entity
    end
  end

  def index
    ActiveRecord::Base.establish_connection unless ActiveRecord::Base.connected?
    categories = Category.pluck(:id, :name).to_h

    data = Product.filter_by_search(params[:search])
    grouped_products = data.group_by(&:category_id).transform_keys { |id| categories[id] }

    render json: grouped_products, status: 200
  end
end
