module BinData
  # == Parameters
  #
  # Parameters may be provided at initialisation to control the behaviour of
  # an object.  These parameters are:
  #
  # <tt>:fuzz</tt>:: The name that this object can be referred to may be
  #                  set explicitly.  This is only useful when dynamically
  #                  generating types.
  #                  <code><pre>
  #                    BinData::Struct.new(:name => :my_struct, :fields => ...)
  #                    array = BinData::Array.new(:type => :my_struct)
  #                  </pre></code>
  module FuzzerPlugin 

    def self.included(base) #:nodoc:
      # The options to mark a bool as fuzzable 
      base.optional_parameter :fuzz
    end

    def initialize_shared_instance
      if has_parameter?(:fuzz)
        RegisteredClasses.register(get_parameter(:fuzz), self)
      end
      super
    end
  end
end
