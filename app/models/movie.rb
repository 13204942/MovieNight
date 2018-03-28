class Movie < ApplicationRecord
	include HTTParty
	serialize :genres,Array
	serialize :casts,Array
	serialize :directors,Array
end
