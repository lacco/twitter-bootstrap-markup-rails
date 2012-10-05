module Twitter::Bootstrap::Markup::Rails
  class OptionsHash < Hash
    def initialize(hash)
      super
      replace(hash)
    end

    def merge!(other_hash)
      super(other_hash) do |key, oldval, newval|
        if oldval.respond_to?(:merge!)
          oldval.merge!(newval)
        else
          newval
        end
      end
      self
    end
  end
end