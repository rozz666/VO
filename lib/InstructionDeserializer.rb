class InstructionDeserializer
  def initialize instructionFactory
    @instructionFactory = instructionFactory
  end
  def deserialize stream
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