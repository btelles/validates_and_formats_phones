String.class_eval do 
  #Formats a phone according to the provided formats.
  # _formats_ is a hash whose keys are the number of digits
  # and values are the formats of the phone number.
  # For example {10 => "(###) ###-####"}
  def to_phone(*args)
    if args.empty?
      formats = {10 => '(###) ###-####'}
    else
      formats = args.flatten.inject({}) do |all_formats, format|
        all_formats[format.count('#')] = format
        all_formats
      end
    end
    digits = scan(/\d/)
    final_string = formats[scan(/\d/).size].each_char.inject('') do |result, character|
      character == '#' ? result << digits.shift : result << character
      result
    end

    final_string
  end
end
