class ProductsController < ApplicationController

  class Entry
    def initialize(title, link)
      @title = title
      @link = link
    end
    attr_reader :title
    attr_reader :link
  end

  def index
    require 'open-uri'

    doc = Nokogiri::HTML(open("http://gupharma.com/productos/gupharma"))

    entries = doc.css('.row-fluid>.span4')
    @entriesArray = []
    entries.each do |entry|
      title = entry.css('div.caption>h3').text
      link = entry.css('div.img-container>img')[0]['src']
      # link = 'test'
      # debugger/
      @entriesArray << Entry.new(title, link)
    end

    doc = Nokogiri::HTML(open("http://gupharma.com/productos/intrahospitalaria"))

    entries = doc.css('.row-fluid>.span4')
    @gupharmaintra = []
    entries.each do |entry|
      title = entry.css('div.caption>h3').text
      link = entry.css('div.img-container>img')[0]['src']
      # link = 'test'
      # debugger/
      @gupharmaintra << Entry.new(title, link)
    end

    doc = Nokogiri::HTML(open("http://gupharma.com/producto/preventor"))

    entries = doc.css('.span4>.row')
    # debugger
    @preventor = []
    entries.each do |entry|
      title = entry.css('.span6.text-left').text
      link = entry.css('.span6.text-right>img')[0]['src']
      # link = "test"

      # debugger/
      @preventor << Entry.new(title, link)
    end





  end

  def show
  end
end
