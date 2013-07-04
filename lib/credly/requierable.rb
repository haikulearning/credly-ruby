module Credly
  module Requierable
    def require_present(options, *args)
      args.each do |argument|
        raise ArgumentError.new("Argument #{argument} is required") if options[argument].nil?
      end
    end

    def require_at_least_one_file(options, *args)
      args.each do |argument|
        raise ArgumentError.new('There should be at least one file') if options[argument].empty?
      end
    end
  end
end