class Array
  def where(attributes)
    k, v = attributes.shift
    self.select { |e| e[k.to_s] == v }
  end

  def match(attributes)
    k,v = attributes.shift
    self.select { |e| e[k.to_s].to_s.match(v) }
  end
end
