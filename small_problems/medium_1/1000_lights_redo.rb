def switch_lights(lights, n)
1.upto(n) do |i|
    lights.each_with_index do |position, idx|
      if ((idx + 1) % i) == 0
        lights[idx] = !lights[idx]
      end
    end
  end
  lights
end

def create_lights(n)
  lights = []
  n.times { lights << false }
  lights
end

def find_on_lights(lights)
  lights_on = []
  lights.each_with_index do |position, idx|
    if position == true
      lights_on << (idx + 1)
    end
  end
  lights_on
end

def lights(n)
  lights = create_lights(n)
  lights = switch_lights(lights, n)
  lights_on = find_on_lights(lights)
end

p lights(5) == [1, 4]
p lights(10) == [1, 4, 9]