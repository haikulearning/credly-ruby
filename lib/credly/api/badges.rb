module Credly
  class Api
    class Badges < Base

      def all(options = Hash.new)
        get("badges", options)
      end

      def create(options = Hash.new)
        post('badges', options)
      end

      def find(id, options = Hash.new)
        get("badges/#{id}", options)
      end

      def update(id, options = Hash.new)
        post("badges/#{id}", options)
      end

      def categories
        Categories.new(:client => @client)
      end

    end
  end
end