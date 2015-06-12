require 'json'
require 'rest-client'

class HappyApps::APIClient
	def initialize(access_token, refresh_token,expires_in = nil, base_url=nil) 
		@access_token = access_token
		@refresh_token = refresh_token
		@base_url = base_url
		if expires_in != nil
			@expires_at = DateTime.now + expires_in.seconds
		end
	end

	def self.authorize(username,password,client_id='ha-customer',base_url='https://api.happyapps.io/')
		authorize_response = RestClient.post "#{base_url}oauth/token", {grant_type: 'password', scope:'write', client_id: client_id, username: username, password: password}

		credentials = JSON.parse(authorize_response.to_s)

		return self.new(credentials['access_token'],credentials['refresh_token'],credentials['expires_at'], base_url)
	end


	def checks
		HappyApps::ChecksInterface.new(@access_token, @refresh_token, @expires_at, @base_url)
	end
end