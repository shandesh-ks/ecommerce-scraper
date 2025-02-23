require 'open-uri'
require 'nokogiri'
require 'uri'
require 'net/http'

class ScraperService
  require 'nokogiri'
  require 'net/http'
  require 'uri'

  def self.fetch_product_details(url)
    response = Net::HTTP.get_response(URI.parse(url))
    raise 'Please provide valid url:status:422' unless response.is_a?(Net::HTTPSuccess)

    doc = Nokogiri::HTML(response.body)

    details = {
      title: doc.at('div h1._6EBuvT')&.text || extract_meta_content(doc, 'og:title'),
      description: extract_meta_content(doc, 'og:description'),
      price: (doc.at('div[class*="Nx9bqj CxhGGd"]')&.text&.gsub('₹', '').gsub(',','').to_i.to_f rescue nil) || extract_price(doc),
      image: extract_meta_content(doc, 'og:image'),
      size: (doc.at('li[id^="swatch-"] a')&.text&.strip rescue nil) || extract_sizes(doc).present? ? extract_sizes(doc) : nil,
      category: ((doc.css('div.r2CdBx a').map(&:text) - ['Home']).first rescue nil),
      available_offers: available_offers(doc),
      offer_percentage: (doc.at('div[class*="UkUFwK WW8yVX dB67CR"]')&.text&.to_f rescue nil),
      rating: doc.css('div[class*="OVvZks"]').text == 'Be the first one to rate' ? 0 : doc.css('div[class*="ipqd2A"]')&.text.to_f,
      specifications: specifications(doc),
      no_of_ratings: num_rat_rev_hash(doc)[0],
      no_of_reviews: num_rat_rev_hash(doc)[1],
    }

    details
  end

  def self.num_rat_rev_hash(doc)
    ratings_reviews_span = doc.at('span[class="Wphh3N"]')

    if ratings_reviews_span
      spans = ratings_reviews_span.search('span > span')

      ratings_text = spans[0]&.text&.strip
      reviews_text = spans[2]&.text&.strip

      ratings = ratings_text&.match(/([\d,]+) Ratings/)&.captures&.first
      reviews = reviews_text&.match(/([\d,]+) Reviews/)&.captures&.first

      [ratings, reviews]
    else
      [0, 0]
    end
  end

  def self.available_offers(doc)
    offers_div = doc.at('div[class*="I+EQVr"]')
    offers = Hash.new { |hash, key| hash[key] = [] }
    offers_div&.search('li')&.each do |li|
      key = li.at('span[class="ynXjOy"]')&.text&.strip
      value = li.search('span')[1]&.text&.strip

      offers[key] << value if key && value
    end
    offers.compact
  end

  def self.specifications(doc)
    details = {}
    doc.css('div[class*="_5Pmv5S"] div.row').each do |row|
      details[row.at('div[class*="col col-3-12 _9NUIO9"]')&.text&.strip] = row.at('div[class*="col col-9-12 -gXFvC"]')&.text&.strip
    end
    details.compact
  end

  def self.extract_meta_content(doc, property)
    doc.at("meta[property='#{property}']")&.[]('content') rescue nil
  end

  def self.extract_price(doc)
    price_elements = [
      doc.at('div[class*="CEmiEU"]'),
      doc.at('span[class*="price"]'),
      doc.at('div[class*="price"]'),
      doc.at('span[class*="amount"]')
    ]
    price_elements.compact.first&.text&.strip.gsub('₹', '').gsub(',','').to_i.to_f rescue nil
  end

  def self.extract_sizes(doc)
    sizes = doc.css('.size-attribute-selector ._1UcWw9, .size-selector span, .size-options div')
    sizes.map(&:text).reject(&:empty?) rescue nil
  end
end
