$:.unshift File.dirname(__FILE__)

require 'simple_framework'

route("/time") do
  if params['format'].nil? || params['format'].empty?
      status 400
      "Unknown time format\n"
  else
    format_hash = {year: '%Y', month: '%m', day: '%d',
                   hour: '%H', minute: '%M', second: '%S'}
    unknown = []
    format_arr = []
    params['format'].split(',').each do |param|
      
      if format_hash.include? param.to_sym
        format_arr << format_hash[param.to_sym]
      else 
        unknown << param
      end    
    end

    if unknown.empty?

      "#{Time.at(0).strftime(format_arr.join('-'))}\n"
    else
      status 400
      "Unknown time format #{unknown}\n"
    end
  end
end




