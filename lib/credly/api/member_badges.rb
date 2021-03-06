module Credly
  class Api
    class MemberBadges < Base

      def create(options = {})
        post('member_badges', options)
      end

      def find(id, options = {})
        get("member_badges/#{id}", options)
      end

      def evidence
        Evidence.new(:client => @client, :member_badge_id => self.id)
      end

    end
  end
end