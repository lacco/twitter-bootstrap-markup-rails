module Twitter::Bootstrap::Markup::Rails
  class HelperCollection
    attr_accessor :calls, :view

    def initialize(view)
      @view = view
      @calls = []
    end

    def method_missing(symbol, *args, &block)
      @calls << HelperMethodCall.new(@view, symbol, args, block)
    end

    def each
      @calls.each do |c|
        yield c
      end
    end

    def [](x)
      @calls[x]
    end

    def size
      @calls.size
    end

    def shift
      @calls.shift
    end
  end

  class HelperMethodCall
    attr_accessor :method, :options, :args

    def initialize(view, symbol, args, block)
      @view    = view
      @method  = symbol
      @options = args.extract_options!
      @args    = args
      @block   = block
    end

    def component
      args = @args
      args << @options.merge(:html => false)

      if @block
        @view.send(@method, *args, &@block)
      else
        @view.send(@method, *args)
      end
    end

    def to_s
      component.to_s.html_safe
    end

  end
end
