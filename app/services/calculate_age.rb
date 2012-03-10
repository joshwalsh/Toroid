class CalculateAge
  def self.for_year(year, entity)
    year - entity.birth_year
  end
end