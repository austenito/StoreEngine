require 'aws-sdk'

AWS.config(
  access_key_id: 'AKIAIME5UWYQEFD3CZQQ',
  secret_access_key: 'KTV6/YE4wMV0iKM+6XrnpoWHjbjqVt7wjfycD6fL'
)

file_name = '../public/images/001.jpg'

#require File.expand_path(File.dirname(__FILE__) + '/../samples_config')

bucket_name = 'yaaagoat_dev'
s3 = AWS::S3.new

# create a bucket
b = s3.buckets.create(bucket_name)

# upload a file
basename = File.basename(file_name)
o = b.objects[basename]
o.write(:file => file_name)

puts "Uploaded #{file_name} to:"
puts o.public_url

# generate a presigned URL
puts "\nUse this URL to download the file:"
puts o.url_for(:read)

puts "(press any key to delete the object)"
$stdin.getc

o.delete

file_path = '../public/images'

Dir.foreach(file_path) do |item|
  next if item == "." or item == ".." or item == "original"
  full = file_path+"/"+item
  basename = File.basename(full)
  o = b.objects[basename]
  o.write(file: full)
  puts o.url_for(:read)
end

b.objects.each do |item|
  puts item
end
