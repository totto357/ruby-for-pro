def to_hex(r, g, b)
  [r, g, b].reduce("#") { |hex, int| hex + int.to_s(16).rjust(2, "0") }
end

def to_ints(hex)
  hex.scan(/\w\w/).map(&:hex)
end
