class SearchFilter
	attr_reader :field, :value, :type

	def initialize field, value, type=:match
		@field = field
		@value = value
		@type = type
	end

	def query
		self.send("#{type}_query")
	end

private

	def match_query
		-> (collection) { collection.where(field => value) }
	end

	def reference_query
		raise "by_field should be hash if type is :reference" unless field.is_a? Hash

		association = field.keys.first
		property = field.values.first

		-> (collection) do
			table_name = collection.reflect_on_association(association).klass.table_name
			collection.joins(association).where(table_name => {property => value})
		end
	end

	def contains_query
		-> (collection) { collection.where("#{field} LIKE ?", "%#{value}%") }
	end
end
