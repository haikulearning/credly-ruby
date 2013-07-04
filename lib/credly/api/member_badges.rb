module Credly
  class Api
    class MemberBadges < Base

      def create(options = Hash.new)
        post('member_badges', options)
      end

      def find(id, options = Hash.new)
        get("member_badges/#{id}", options)
      end

      def evidence
        Evidence.new(:client => @client)
      end

    end
  end
end