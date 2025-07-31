module PhoneNumber
  def self.clean(phone_number)
    phone_number = phone_number.gsub(/\D/, '')
    if phone_number.match?(/\A1?[2-9]\d{2}[2-9]\d{6}\z/)
      phone_number.length == 10 ? phone_number : phone_number[1..]
    end
  end
end
