class CheckoutMailer < ActionMailer::Base
  default from: "yaaagoat@gmail.com"

  def file_path image_name
    "#{Rails.root}/tmp/images/#{image_name}"
  end

  def order_fulfillment(user, order, images)
    @user = user

    images.each do |image|
      image_name = image.url.split("/").last.split("?").first
      make_temp image_name, image
      attachments[image_name] = File.read(file_path image_name)
    end

    mail(:to => "#{user.first_name} <#{user.email}>", :subject => "Here are your images.")

  end

  def make_temp image_name, image
    open(file_path(image_name), "wb") do |f|
      f << open(image.url).read
    end
  end
end

