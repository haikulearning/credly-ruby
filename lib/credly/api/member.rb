module Credly
  class Api
    class Members < Base

      class Badges < Base
        def all(member_id, options = {})
          get("members/#{member_id}/badges", options)
        end

        def given(member_id, options = {})
          get("members/#{member_id}/badges/given", options)
        end
      end

      def all(options = {})
        get("members", options)
      end

      def find(id, options = {})
        get("members/#{id}", options)
      end

      def badges
        Badges.new(:client => @client)
      end

    end
  end
end