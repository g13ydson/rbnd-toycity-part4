require_relative 'find_by'
require_relative 'errors'
require 'csv'

class Udacidata
  @@data_path = File.dirname(__FILE__) + "/../data/data.csv"

  def self.create(options = {})
    db = CSV.read(@@data_path)

    is_product_update = options[:id] ? true : false

    prod = Product.new(options)
    CSV.open(@@data_path, 'wb') do |csv|
      db.each do |data|
      	csv = is_product_update && data[0].to_i == prod.id ? csv << [prod.id, prod.brand, prod.name, prod.price] :  csv << data
      end
      unless is_product_update
        csv << [prod.id, prod.brand, prod.name, prod.price]
      end
    end

    return prod
  end

  def self.all
    all_products = []
    CSV.foreach( @@data_path, headers: true ) do |prod|
      all_products << Product.new( id: prod["id"], brand: prod["brand"], name: prod["product"], price: prod["price"] )
    end
    all_products
  end

  def self.first(n = 1)
    data = self.all
    n == 1 ? data.first(1)[0] : data.first(n)
  end

  def self.last(n = 1)
    data = self.all
    n == 1 ? data.last(1)[0] : data.last(n)
  end

  def self.find(index)
    data = self.all[index-1]
    unless data
      raise ProductNotFoundError
    else
      return data
    end
  end


end
