class ApplicationController < ActionController::API
	include Response
  	include ExceptionHandler


  	before_action :authenticate_request 

  		attr_reader :current_user1 

	  	private 

	  	def authenticate_request 
	  		@current_user1 = AuthorizeApiRequest.call(request.headers).result 
	  		render json: { error: 'Not Authorized' }, status: 401 unless @current_user1 
	  		#render json:{:error => "Bad credentials"}, status::unauthorized
	  	end
end


