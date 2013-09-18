module Credly
  class Api
    class Me < Base
      def profile(options = {})
        get("me", options)
      end
    end
  end
end