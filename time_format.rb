  
class TimeFormat

  FORMAT_HASH = {year: '%Y', month: '%m', day: '%d',
                 hour: '%H', minute: '%M', second: '%S'}

  def initialize(format_string)
    @format_string_arr = format_string.split(',')
  end

  def unknown_arr
    @unknown_arr = []
    @format_string_arr.each do |param|
      @unknown_arr << param unless FORMAT_HASH.include? param.to_sym
    end
    @unknown_arr
  end

  def format_arr
    @format_arr = []
    @format_string_arr.each do |param|
      @format_arr << FORMAT_HASH[param.to_sym] if FORMAT_HASH.include? param.to_sym
    end
    @format_arr
  end

end
