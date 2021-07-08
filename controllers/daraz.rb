require 'open-uri'
require 'nokogiri'
require 'json'

def daraz_scraper
  require 'nokogiri'

  page = `curl --user-agent "Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0)" https://www.daraz.pk/computing`
  parse_page = Nokogiri::HTML(page)

  products = []
  list = parse_page.at('div.c1_t2i')

  list.search('div.product-item').each do |product|

    item_name = product.css("div.c16H9d a").text
    sales_price = product.css("div.c3gUW0 span").text
    standard_price = product.css("div.c3lr34 span del").text
    
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

get('/daraz_scraper') do
  @data = daraz_scraper
  erb :daraz
end