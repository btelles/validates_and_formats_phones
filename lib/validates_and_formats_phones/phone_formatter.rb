String.class_eval do 
  #Formats a phone according to the provided formats.
  # _formats_ is an array whose values are a string
  # with '#' signs indicating where digits should appear.
  def to_phone(*args)
    args.empty? ?
      formats = {10 => '(###) ###-####'} :
      formats = args.flatten.inject({}) { |all_formats, format| all_formats.merge({format.count('#') => format}) }

    to_formatted_number(formats)
  end

  private

  def to_formatted_number(formats = {})
    digits = scan(/\d/)
    total_digits = digits.size
    if formats[total_digits]
      result = ''
      formats[total_digits].each_char do | character|
        character == '#' ? result << digits.shift : result << character
      end
      result
    else
      self
    end
  end

end
