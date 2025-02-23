class UpdateProductsJob < ApplicationJob
  queue_as :default

  def perform
    outdated_products = Product.where("last_scraped_at < ?", 1.week.ago)
    outdated_products.each do |product|
      product_data = ScraperService.fetch_product_details(product.url)
      product.update(product_data.merge(last_scraped_at: Time.current))
    end
  end
end
