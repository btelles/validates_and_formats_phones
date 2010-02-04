  module ValidatesAndFormatsPhones
    DEFAULT_FORMAT = "(###) ###-####"
    def self.included(base)
      base.send :extend, ClassMethods
    end

    module ClassMethods


      def validates_and_formats_phones(*args)
        formats, fields = extract_formats_and_fields(args)
        send :include, InstanceMethods

        validates_each *fields do |record, attr, value|
          size_options = formats.collect {|a| a.count '#'}
          unless value.blank? || size_options.include?(value.scan(/\d/).size)
            if size_options.size > 1
              last = size_options.pop
              record.errors.add attr, "must have #{size_options.join(', ')} or #{last} digits."
            else
              record.errors.add attr, "must have #{size_options[0]} digits."
            end
          else
            record.format_phone_field(attr, formats)
          end
        end
      end

      private

      def extract_formats_and_fields(formats_and_fields)
        formats = []
        fields = []
        formats_and_fields.each do |option|
          option.to_s =~ /#/ ?
            formats << option :
            fields << option.to_sym
        end
        formats << DEFAULT_FORMAT if formats.empty?
        fields  << :phone if fields.empty?
        [formats, fields]
      end
    end

    module InstanceMethods

      def format_phone_field(field_name, formats = [])
        formats << DEFAULT_FORMAT if formats.empty?
        self.send("#{field_name}=", self.send(field_name).to_s.to_phone(formats)) unless send(field_name).blank?
      end
    end
  end

  ActiveRecord::Base.send :include, ValidatesAndFormatsPhones
