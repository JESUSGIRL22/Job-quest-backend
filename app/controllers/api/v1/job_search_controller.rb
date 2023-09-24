module Api
  module V1
    class JobSearchController < ApplicationController
      def index
        # Define search parameters from query parameters
        keywords = params[:keywords]
        location = params[:location]

        # Initialize a base query
        @results = JobListing.all

        # Apply filters based on query parameters
        if keywords.present?
          # Perform a case-insensitive search in title and description
          @results = @results.where("lower(title) LIKE ? OR lower(description) LIKE ?", "%#{keywords.downcase}%", "%#{keywords.downcase}%")
        end

        if location.present?
          @results = @results.where("lower(location) LIKE ?", "%#{location.downcase}%")
        end

        # You can add more filtering based on other query parameters here

        render json: @results
      end
    end
  end
end
