class UsersController < ApplicationController
	filterable_by :name, type: :contains
	filterable_by :city, type: :reference, on: {city: :name}
	filterable_by :eye_color

	def index
		@users = apply_filters_on User.all
	end
end
