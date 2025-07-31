# frozen_string_literal: true

module TwoFer
  def self.two_fer(person=nil)
    person ? "One for #{person}, one for me." : 'One for you, one for me.'
  end
end
