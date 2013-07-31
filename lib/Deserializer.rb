class Deserializer
  def initialize instructions
    @instructions = instructions
  end
  def deserialize seq
    node = @instructions
    ins = []
    seq.each do |s|
      node = node[s]
      unless node.kind_of?(Array) then
        ins << node
        node = @instructions
      end
    end
    ins
  end
end