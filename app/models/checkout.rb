class Checkout
  attr_reader :name, :credit_card_number, :address_line1, :address_line2, :city, :state, :zipcode

  def initialize billing_info
    @credit_card_number = billing_info[:credit_card_number]
    @name = billing_info[:name]
    @address_line1 = billing_info[:address_line1]
    @address_line2 = billing_info[:address_line2]
    @city = billing_info[:city]
    @state = billing_info[:state]
    @zipcode = billing_info[:zipcode]

  end

  def valid?
    errors.empty?
  end

  def valid_credit_card?
    not_blank?(credit_card_number) && CreditCardValidator::Validator.valid?(credit_card_number)
  end

  def not_blank? info
    !(info.nil? || info.empty?)
  end

  def errors
    @errors ||= generate_errors
  end

  def generate_errors
    generated_errors = []
    generated_errors << CheckoutErrors.new(:credit_card_info) unless valid_credit_card?
    generated_errors << CheckoutErrors.new(:address_line1) unless not_blank? address_line1
    generated_errors << CheckoutErrors.new(:state) unless not_blank? state
    generated_errors << CheckoutErrors.new(:city) unless not_blank? city
    generated_errors << CheckoutErrors.new(:zipcode) unless not_blank? zipcode
    generated_errors << CheckoutErrors.new(:name) unless not_blank? name
    generated_errors
  end
end

class CheckoutErrors
  attr_reader :error_type

  def initialize error_type
    @error_type = error_type

  end

  def ==(other)
    error_type == other.error_type
  end
end

