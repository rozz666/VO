require 'Cell'
class CellFactory
  def create initialEnergy, geneticCode, cloner
    Cell.new initialEnergy, geneticCode, cloner
  end
end