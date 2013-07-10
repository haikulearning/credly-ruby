module Credly
  class Api
    class Badges < Base

      def all(options = {})
        get("badges", options)
      end

      def create(options = {})
        post('badges', options)
      end

      def find(id, options = {})
        get("badges/#{id}", options)
      end

      def update(id, options = {})
        post("badges/#{id}", options)
      end

      def categories
        Categories.new(:client => @client)
      end

    end
  end
end