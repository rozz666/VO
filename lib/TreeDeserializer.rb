class TreeDeserializer
  class StreamReader
    def initialize trees, seq
      @trees = trees
      @seq = seq
    end
    def get tag
      node = @trees[tag]
      loop do
        node = node[@seq.next]
        return node unless node.kind_of?(Array)
      end
    end
  end
  def initialize trees
    @trees = trees
  end
  def getStream seq
    StreamReader.new @trees, seq.each
  end
end