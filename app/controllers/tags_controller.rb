class TagsController < ApplicationController

	def show
		@tag = Tag.find(params['id'].to_i)
	end

end
