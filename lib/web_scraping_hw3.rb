# frozen_string_literal: true

# Vichisorn Wejsupakul
# 6210546013
require "nokogiri"
require "httparty"

require_relative "web_scraping_hw3/version"

# Use to Scraping the website of set to find the asset of all corporation.
module WebScrapingHw3
  class Error < StandardError; end

  BASE_URL = "https://www.set.or.th"

  # Convert any url link from string to nokogiri html.
  # To use with any nokogiri tools.
  # @param [String] url
  # @return [HTML]
  def make_parsed(url)
    unparsed_page = HTTParty.get(url)
    Nokogiri::HTML(unparsed_page.body)
  end

  url = "#{BASE_URL}/set/commonslookup.do"
  parsed_page = make_parsed(url)
  companies_pages = parsed_page.css("div.col-xs-12.padding-top-10.text-center.capital-letter").css("a")

  companies_pages.each do |companies_page|
    companies_url = "#{BASE_URL}#{companies_page.attributes["href"].value}"
    companies_parsed_page = make_parsed(companies_url)
    companies_table = companies_parsed_page.css("table.table-profile.table-hover.table-set-border-yellow").css("a")

    companies_table.each do |company_tag_a|
      url_stock_profile_page = "#{BASE_URL}#{company_tag_a.attributes["href"].value}"
      stock_profile_page = make_parsed(url_stock_profile_page)
      url_stock_highlight_page = stock_profile_page.css("ul.nav.nav-tabs.set-nav-tabs")
                                                   .css("a")[1].attributes["href"].value

      stock_url = "#{BASE_URL}#{url_stock_highlight_page}"
      stock_parsed_page = make_parsed(stock_url)

      name = stock_parsed_page.css("div.col-xs-12.col-md-12.col-lg-8").css("h3").text
      stock_table_row = stock_parsed_page.css("table.table.table-hover.table-info").css("tr")
      table_column = stock_table_row[2].css("td")
      cost = table_column[-2].text

      puts("#{name} : #{cost}")
    end
  end
end
