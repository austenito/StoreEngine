class CheckoutMailer < ActionMailer::Base
  default from: "yaaagoat@gmail.com"

  def order_fulfillment(user, order, image_paths)
    @user = user
    file_names = image_paths.collect do | image_path |
      image_path.split("/").last.split("?").first
    end

    # attachments = Hash.new
    image_paths.each_with_index do |image_path, index|
      file_name = file_names[index]
      image_path = image_path.split("?").first
      attachments[file_name] = File.read("#{Rails.root}/public#{image_path}")
    end
    #attachments["001.jpg"] = File.read("#{Rails.root}/public/images/001.jpg")
    mail(:to => "#{user.first_name} <#{user.email}>", :subject => "Here are your images...")
  end
end


