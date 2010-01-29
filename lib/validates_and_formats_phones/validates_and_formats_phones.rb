  module ValidatesAndFormatsPhones
    DEFAULT_FORMAT = { 10 => "(###) ###-####"}
    def self.included(base)
      base.send :extend, ClassMethods
    end

    module ClassMethods


      def validates_and_formats_phones(*args)
        options = args.extract_options!
        options = DEFAULT_FORMAT if options.empty?
        args.empty? ? field_names = [:phone] : field_names = args

         send :include, InstanceMethods

         validates_each *field_names do |record, attr, value|
           size_options = options.keys
           unless value.blank? || size_options.include?(value.scan(/\d/).size)
             if size_options.size > 1
               last = size_options.pop
               record.errors.add attr, "must have #{size_options.join(', ')} or #{last} digits."
             else
               record.errors.add attr, "must have #{size_options[0]} digits."
           end

         end
         after_validation "format_phone_fields(#{field_names.inspect}, #{options.inspect})"
        end
      end
    end

    module InstanceMethods

      def format_phone_fields(fields = [:phone], *args)
        options = args.empty? ? DEFAULT_FORMAT : args.extract_options!
        fields.each do |field_name|
          format_phone_field(field_name, options) unless send(field_name).blank?
        end
      end
      def format_phone_field(field_name, *args)
        options = args.extract_options! || DEFAULT_FORMAT
        self.send("#{field_name}=", self.send(field_name).to_s.to_phone(options))
      end
    end
  end

  ActiveRecord::Base.send :include, ValidatesAndFormatsPhones
