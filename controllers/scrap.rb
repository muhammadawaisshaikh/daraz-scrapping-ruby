require 'open-uri'
require 'nokogiri'
require 'json'

def scraper
  require 'nokogiri'

  page = `curl --user-agent "Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0)" https://www.uniqlo.com/us/en/men/sale`
  parse_page = Nokogiri::HTML(page)

  products = []
  list = parse_page.at('ul#search-result-items')

  list.search('li.grid-tile').each do |product|

    item_name = product.css("div.product-tile .product-tile-info .product-name a").text
    sales_price = product.css("div.product-tile .product-tile-info .product-pricing .product-sales-price").text
    standard_price = product.css("div.product-tile .product-tile-info .product-pricing .product-standard-price").text
    
    products.push(
      name: item_name,
      price: sales_price,
      standard_price: standard_price
    )
    
    # preview data in terminal
    # puts products
  end

  products

  # generating JSON
  # json = JSON.generate(products)
end

get('/scraper') do
  @data = scraper
  erb :scrap
end