namespace :update_products do
  desc "Run UpdateProductsJob"
  task run: :environment do
    p "running scheduler"
    outdated_products = Product.where("last_scraped_at < ?", 1.week.ago)
    outdated_products.each do |product|
      product_data = ScraperService.fetch_product_details(product.url)

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
    end
  end
end
