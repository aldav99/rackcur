require_relative 'time_format'

class Handler
  def call(env)
    req = Rack::Request.new(env)
    case req.path_info
    when /time/
      if req.params['format'].nil? || req.params['format'].empty?
        [400, {"Content-Type" => "text/plain"}, ["Unknown time format!\n"]]
      else
        format = TimeFormat.new(req.params['format'])

        if format.unknown_arr.empty?
           [200, {"Content-Type" => "text/plain"}, ["#{Time.at(0).strftime(format.format_arr.join('-'))}\n"]]
        else
          [400, {"Content-Type" => "text/plain"}, ["Unknown time format #{format.unknown_arr}\n"]]
        end
      end
    else
      [404, {"Content-Type" => "text/plain"}, ["Unknown path!\n"]]
    end
  end
end
