module Api
  module V1
    class LinksController < ApplicationController
      def index
        render json: Link.all.to_json
      end
    end
  end
end