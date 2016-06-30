module Analyzable
  
  def average_price(array_of_products)
  	(array_of_products.inject(0){ |sum, product| sum + product.price.to_f}/array_of_products.size).round(2)
  end

  def count_by_brand(array_of_products)
    brands = Hash.new
    array_of_products.each do |product|
    	brands.keys.include?(product.brand) ? brands[product.brand] += 1 : brands[product.brand] = 1
    end
    return brands
  end
    
  def count_by_name(array_of_products)
    names = Hash.new
    array_of_products.each do |product|
      	names.keys.include?(product.name) ? names[product.name] += 1 : names[product.name] = 1
    end
    return names
  end

  def print_report(array_of_products)

    puts "Inventory by brand:"
    puts
    count_by_brand(array_of_products).each do |k,v|
      puts "#{k}: #{v}"
    end
    puts
    puts "*" * 15
    puts "Inventory by name:"
    puts
    count_by_name(array_of_products).each do |k,v|
      puts "#{k}: #{v}"
    end
    puts
    puts "*" * 15
    puts "Average price:"
    puts
    output = "$"
    output += "#{average_price(array_of_products)}"
  end




end
