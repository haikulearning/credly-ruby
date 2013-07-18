module Credly
  class Api
    class MemberBadges < Base

      class Evidence < Base
        attr_accessor :member_badge_id

        def all(options = {})
          get("member_badges/#{self.member_badge_id}/evidence", options)
        end
      end

    end
  end
end