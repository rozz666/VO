class Deserializer
  class StreamReader
    def initialize instructions, seq
      @instructions = instructions
      @seq = seq
    end
    def getSymbol
      node = @instructions
      while not @seq.empty?
        node = node[@seq.delete_at(0)]
        unless node.kind_of?(Array) then
          return node
        end
      end
    end
  end
  def initialize instructions
    @instructions = instructions
  end
  def getStream seq
    StreamReader.new @instructions, seq
  end
end