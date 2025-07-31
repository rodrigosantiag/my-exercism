module Port
  # TODO: define the 'Identifier' constant
  Identifier = :PALE

  def self.get_identifier(city)
    city.upcase[0..3].to_sym
  end

  def self.get_terminal(ship_identifier)
    port_a_cargos = %w[OIL GAS]
    return :A if port_a_cargos.include? ship_identifier.to_s[0..2]

    :B
  end
end
