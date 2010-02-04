String.class_eval do 
  #Formats a phone according to the provided formats.
  # _formats_ is an array whose values are a string
  # with '#' signs indicating where digits should appear.
  def to_phone(*args)
    args.empty? ?
      formats = {10 => '(###) ###-####'} :
      formats = format_sizes(args)

    to_formatted_number(formats)
  end

  def to_formatted_number(formats = {})
    digits = scan(/\d/)
    if formats[digits.size]
      final_string = formats[digits.size].each_char.inject('') do |result, character|
        character == '#' ? result << digits.shift : result << character
        result
      end
      final_string
    else
      self
    end
  end

  private

  def format_sizes(formats_array)
    formats_array.flatten.inject({}) do |all_formats, format|
      all_formats[format.count('#')] = format
      all_formats
    end
  end
end
