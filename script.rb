regex = /(\d\d:\d\d:\d\d,\d\d\d) --> (\d\d:\d\d:\d\d,\d\d\d)/
numberSec = 0

def decal(time, secondsDecal)
  timestamp = 0
  arr = time.gsub(",", ".").split(':')
  timestamp = arr[0].to_i * 3600000 + arr[1].to_i * 60000 + arr[2].to_f * 1000
  timestamp -= secondsDecal * 1000      # seconds to timestamp so *1000
  hour = (timestamp / 3600000).to_i
  timestamp = timestamp % 3600000
  min = (timestamp / 60000).to_i
  timestamp = timestamp % 60000
  sec = timestamp / 1000
  
  return "#{('0' + hour.to_s)[-2..-1]}:#{('0' + min.to_s)[-2..-1]}:#{((sec < 10.0) ? '0' : '') + ('%.3f' % sec).gsub('.', ',')}"
end


if ARGV.size < 2
  STDERR.puts "You should at least give a number of seconds and a file"
  exit
end

ARGV.each_with_index { |arg, i|
  if (i == 0)
    numberSec = arg.to_f
  elsif (numberSec == 0)
    exit
  else
    File.open("new_" + arg, "w") do |out|
      File.open(arg, 'r').each_line { |line|
        m = regex.match(line)
        if (m != nil)
          out.puts("#{decal(m[1], numberSec)} --> #{decal(m[2], numberSec)}")
        else
          out << line
        end
      }
    end
  end
}
