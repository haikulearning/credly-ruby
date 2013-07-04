module Credly
  class Api
    class MemberBadges < Base

      class Evidence < Base
        def all(member_badge, options = Hash.new)
          get("member_badges/#{member_badge}/evidence", options)
        end
      end

    end
  end
end