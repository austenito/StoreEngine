class CheckoutMailer < ActionMailer::Base
  default from: "yaaagoat@gmail.com"

  def order_fulfillment(user, order)
    @user = user
    attachments["001.jpg"] = File.read("#{Rails.root}/public/images/001.jpg")
    mail(:to => "#{user.first_name} <#{user.email}>", :subject => "Here are your images...")
  end
end


