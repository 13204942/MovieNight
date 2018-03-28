require 'MovieApi.rb'

class MoviesController < ApplicationController
	def index
		@time = Time.current.to_s
		search_string = params[:search]
		if params[:search].present?
			if search_string.chars.count < search_string.bytes.count
				text_ascii = '\u'+search_string.ord.to_s(16)
				@searchmovies = ::MovieApi.get_movies("search?q=#{text_ascii}").movies	
			else
				@searchmovies = ::MovieApi.get_movies("search?q=#{search_string}").movies	
			end
		else
			@searchmovies = ::MovieApi.get_movies("coming_soon").movies
		end
	end

	def hot
		@hotmovies = ::MovieApi.get_movies("new_movies?apikey=0b2bdeda43b5688921839c8ecb20399b").movies	
	end

	def comingsoon
		@comingmovies = ::MovieApi.get_movies("coming_soon").movies
	end

	def weekly
		@weeklymovies = ::MovieApi.get_movies("weekly?apikey=0b2bdeda43b5688921839c8ecb20399b").movies
	end
end
