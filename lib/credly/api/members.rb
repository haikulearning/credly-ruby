module Credly
  class Api
    class Members < Base

      class Badges < Base
        attr_accessor :member_id

        def all(options = {})
          get("members/#{self.member_id}/badges", options)
        end

        def given(options = {})
          get("members/#{self.member_id}/badges/given", options)
        end
      end

      def all(options = {})
        get("members", options)
      end

      def find(id, options = {})
        get("members/#{id}", options)
      end

      def badges
        Badges.new(:client => @client, :member_id => self.id)
      end

    end
  end
end