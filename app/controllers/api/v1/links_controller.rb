module Api
  module V1
    class LinksController < ApplicationController
      def index
        render json: current_user.links
      end
    end
  end
end