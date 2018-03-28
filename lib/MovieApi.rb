require 'httparty'

class MovieApi
	include HTTParty

	base_uri 'https://api.douban.com'

	default_timeout 30 # hard timeout after 30 seconds

	attr_accessor :movies

	debug_output $stderr

	def initialize(response)
		@movies = response['subjects']
	end

	def handle_timeouts
    begin
      yield
    rescue Net::OpenTimeout, Net::ReadTimeout
      {}
    end
  end

	def self.get_movies(type)
		#type_ascii = '\u'+type.ord.to_s(16)
		# return type_ascii
		#response = HTTParty.get("https://api.douban.com/v2/movie/#{type_ascii}")
		response = get("/v2/movie/#{type}")
		#response = HTTParty.get('https://api.douban.com/v2/movie/coming_soon')
		if response.success?
			new(response)
		else
			response = get("/v2/movie/coming_soon")
			#response = HTTParty.get('https://api.douban.com/v2/movie/coming_soon')
			# raise response.response
		end
	end
end

#str = '暗'
#puts str.bytes.count