class CheckoutController < ApplicationController

  def view
  end

  def confirm
    puts "The number is: #{params[:creditCardNumber].inspect}"
    unless CreditCardValidator::Validator.valid?(params[:creditCardNumber])
      redirect_to '/checkout'
    end
  end

end


# CreditCardValidator::Validator.options[:test_numbers_are_valid] = true
# CreditCardValidator::Validator.valid?(credit_card_number)