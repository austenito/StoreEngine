class CheckoutMailer < ActionMailer::Base
  default from: "yaaagoat@gmail.com"

  def file_path(image_name)
    "#{Rails.root}/public/images/#{image_name}"
  end

  def fill_order(order)
    @user = order.user

    attach_images(order)

    mail(:to => "#{@user.first_name} <#{@user.email}>", :subject => "Here are your images.").deliver
  end

  def attach_images(order)
    order.images.each do |image|
      image_name = image.url.split("/").last.split("?").first
      make_temp image_name, image
      attachments[image_name] = File.read(file_path image_name)
    end
  end

  def make_temp(image_name, image)
    open(file_path(image_name), "wb") do |f|
      f << open(image.url).read
    end
  end
end

