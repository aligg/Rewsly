class StoriesController < ApplicationController

	def index
	#@story = Story.all
	@story = Story.search_for params[:q]
	end

	def show
		@story = Story.find params[:id]
	end

	def new
		@story = Story.new
	end

	def create
		@story = Story.new(story_params)
		if @story.save
			redirect_to @story
		else
			render 'new'
		end
	end

private
	def story_params
		params.require('story').permit(:title, :link, :upvotes, :category)
	end 

end



