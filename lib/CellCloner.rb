class CellCloner
  def initialize cellFactory, programDeserializer, initialEnergy
    @cellFactory, @programDeserializer, @initialEnergy = cellFactory, programDeserializer, initialEnergy
  end
  def clone geneticCode
    cell = @cellFactory.create(@initialEnergy, geneticCode, self)
    @programDeserializer.deserialize geneticCode, cell
    cell
  end
end
