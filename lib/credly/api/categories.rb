module Credly
  class Api
    class Badges < Base

      class Categories < Base
        def all(options = {})
          get("badges/categories", options)
        end
      end

    end
  end
end