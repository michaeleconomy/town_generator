class Float
  def floor_to(x)
    offset = 10**x
    (self * offset).floor.to_f / offset
  end
end