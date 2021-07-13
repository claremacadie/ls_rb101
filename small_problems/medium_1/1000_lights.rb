# 1000_lights.rb

def toggle(switches)
  lights = []
  switches.times { lights << 0 }

  for n in 1..switches
    new_lights = []
    lights.each_with_index do |light, i|
      if ((i + 1) % n ) == 0
        light == 0 ? new_lights << 1 : new_lights << 0
      else
        new_lights << light
      end
    end
    lights = new_lights
  end

  lights_on = []
  lights_off = []
  lights.each_with_index do |v, i|
    v == 1 ? lights_on << (i + 1) : lights_off << (i + 1)
  end

  string_off = "lights "
  lights_off.each_with_index do |num, i|
    i < (lights_off.size - 1) ? string_off << "#{num}, " : string_off << "and #{num} are now off; "
  end

  string_on = "lights "
  lights_on.each_with_index do |num, i|
    i < (lights_on.size - 1) ? string_on << "#{num}, " : string_on << "and #{num} are on."
  end
  puts string_off + string_on
  lights_on
end

p toggle(5) == [1, 4]
p toggle(10) == [1, 4, 9]
#p toggle(1000)