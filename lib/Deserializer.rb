class Deserializer
  class StreamReader
    def initialize instructions, seq
      @instructions = instructions
      @seq = seq.each
    end
    def getSymbol
      node = @instructions
      loop do
        node = node[@seq.next]
        return node unless node.kind_of?(Array)
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