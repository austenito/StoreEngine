class CheckoutMailer < ActionMailer::Base
  default from: "yaaagoat@gmail.com"

  def order_fulfillment(current_user, order)
    @user = current_user
    #inside order:
    #find products
    #determine/get image for each product
    #for each product/image, create attachment
    attachments["001.jpg"] = File.read("#{Rails.root}/public/images/001.jpg")
    mail(:to => "#{@user.first_name} <#{@user.email}>", :subject => "Here are your images...")
  end
end


