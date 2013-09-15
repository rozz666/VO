class CellCloner
  def initialize deserializer, instructionFactory
    @deserializer, @instructionFactory = deserializer, instructionFactory
  end
  def clone geneticCode
    stream = @deserializer.getStream(geneticCode)
    instructions = []
    while s = stream.get(:SYMBOL)
      instructions << @instructionFactory.create(s, stream)
    end
    instructions
  end
end