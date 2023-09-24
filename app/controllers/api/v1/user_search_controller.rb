module Api
  module V1
    class UserSearchController < ApplicationController
      def index
        name = params[:name]

        # Perform user search based on the name parameter
        @results = User.where("lower(name) LIKE ?", "%#{name.downcase}%")

        render json: @results
      end
    end
  end
end
