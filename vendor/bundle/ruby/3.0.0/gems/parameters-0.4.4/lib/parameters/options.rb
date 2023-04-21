require 'parameters/param'
require 'parameters/types'

require 'optparse'

module Parameters
  #
  # @since 0.4.0
  #
  module Options
    # The usage messages for various Parameter {Types}.
    USAGES = {
      Types::Integer  => 'NUM',
      Types::Float    => 'DEC',
      Types::Symbol   => 'NAME',
      Types::Time     => 'TIME',
      Types::DateTime => 'DATE|TIME',
      Types::Date     => 'DATE',
      Types::Regexp   => '/REGEXP/',
      Types::URI      => 'URI',
      Types::Array    => 'VALUE [...]',
      Types::Set      => 'VALUE [...]',
      Types::Hash     => 'NAME:VALUE [...]'
    }

    # The OptionParser acceptance classes for various Parameter {Types}.
    ACCEPTS = {
      Types::Object   => Object,
      Types::Boolean  => TrueClass,
      Types::Integer  => Integer,
      Types::Float    => Float,
      Types::Symbol   => Symbol,
      Types::String   => String,
      Types::Time     => String,
      Types::DateTime => String,
      Types::Date     => String,
      Types::URI      => String
    }

    #
    # Returns the option flag for the given parameter.
    #
    # @param [Param] param
    #   The parameter.
    #
    # @return [String]
    #   The option flag.
    #
    # @api semipublic
    #
    def self.flag(param)
      name = param.name.to_s.gsub('_','-')

      if param.type == Types::Boolean
        "--[no-]#{name}"
      else
        "--#{name}"
      end
    end

    #
    # Returns the Usage String for the parameter.
    #
    # @param [Param] param
    #   The parameter.
    #
    # @return [String]
    #   The Usage String.
    #
    # @api semipublic
    #
    def self.usage(param)
      name = param.name.to_s

      type_usage = lambda { |type|
        if type.class == Types::Hash
          type_usage[type.key_type] + ':' + 
          type_usage[type.value_type] + ' [...]'
        elsif type.class <= Types::Array
          type_usage[type.element_type] + ' [...]'
        elsif (type == Types::String) ||
              (type == Types::Object)
          name.upcase
        else
          USAGES[type]
        end
      }

      return type_usage[param.type]
    end

    #
    # Returns the OptionParser acceptance class for the parameter.
    #
    # @param [Param] param
    #   The parameter.
    #
    # @return [Class]
    #   The acceptance class.
    #
    # @api semipublic
    #
    def self.accepts(param)
      type = param.type

      if type <= Types::Hash
        Hash
      elsif type <= Types::Array
        Array
      else
        ACCEPTS[type]
      end
    end

    #
    # Defines an option for the parameter.
    #
    # @param [OptionParser] opts
    #   The option parser.
    #
    # @param [Param] param
    #   The parameter.
    #
    # @param [Hash] options
    #   Additional options for the option.
    #
    # @option options [String] :flag
    #   The short flag for the option.
    #
    # @option options [String] :usage
    #   The USAGE String for the option.
    #
    # @api public
    #
    def self.define(opts,param,options={})
      short_flag = options[:flag]
      long_flag  = flag(param)
      usage      = (options[:usage] || self.usage(param))

      args  = []

      args << short_flag if short_flag
      args << if usage
                "#{long_flag} [#{usage}]"
              else
                long_flag
              end

      args << accepts(param)

      args << "#{param.description}."           if param.description
      args << "Default: #{param.value.inspect}" if param.value

      if param.type <= Types::Hash
        opts.on(*args) do |value|
          if param.value.nil?
            param.value = value
          elsif value
            param.value.merge!(param.coerce(value))
          end
        end
      elsif param.type <= Types::Array
        opts.on(*args) do |value|
          if param.value.nil?
            param.value = value
          elsif value
            param.value += param.coerce(value)
          end
        end
      else
        opts.on(*args) do |value|
          param.value = value
        end
      end
    end

    #
    # Defines an OptionParser for a set of parameters.
    #
    # @param [Parameter] object
    #   The Class or Object which included Parameters.
    #
    # @yield [opts]
    #   If a block is given, it will be passed the newly created OptionParser.
    #
    # @yieldparam [OptionParser] opts
    #   The newly created OptionParser.
    #
    # @return [OptionParser]
    #   The defined OptionParser.
    #
    # @api public
    #
    def self.parser(object)
      OptionParser.new do |opts|
        object.each_param do |param|
          define(opts,param)
        end

        yield opts if block_given?
      end
    end

    protected

    # accept pattern for Symbols
    OptionParser.accept(Symbol, /[A-Za-z][A-Za-z0-9_-]*/) do |s,|
      s.to_sym if s
    end

    # accept pattern for Hashes
    OptionParser.accept(Hash, /((?:\\.|[^\\:])*):((?:\\.|[^\\:])*)/) do |s,k,v|
      if s
        unescape = lambda { |string|
          string.gsub(/\\./) { |match| match[1,1] }
        }

        {unescape[k] => unescape[v]}
      end
    end

  end
end
