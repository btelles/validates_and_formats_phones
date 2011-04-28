module ValidatesAndFormatsPhones
  if defined? Rails::Railtie
    class Railtie < Rails::Railtie
      initializer "validates_and_formats_phones.extend_activerecord_base" do |app|
        ActiveSupport.on_load(:active_record) do
          ValidatesAndFormatsPhones::Railtie.insert
        end
      end
    end
  end

  class Railtie
    def self.insert
      ActiveRecord::Base.send(:include, ValidatesAndFormatsPhones)
    end
  end
end
