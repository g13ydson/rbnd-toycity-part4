class Module
	def create_finder_methods(*attributes)
		attributes.each do |attribute|
			find_by = %Q{
				def self.find_by_#{attribute}(identifier)
					Product.all.find{ |data| data.#{attribute} == identifier }
				end
			}
			class_eval(find_by)
		end
	end
end