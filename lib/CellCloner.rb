class CellCloner
  def initialize deserializer, instructionFactory
    @deserializer, @instructionFactory = deserializer, instructionFactory
  end
  def clone geneticCode
    stream = @deserializer.getStream(geneticCode)
    instructions = []
    while i = deserializeInstruction(stream)
      instructions << i
    end
    instructions
  end
  private
  def deserializeInstruction stream
    s = stream.get(:SYMBOL)
    return nil unless s
    @instructionFactory.create(s, stream)
  end
end