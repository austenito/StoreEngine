
bucket_name = 'yaaagoat_dev'
s3 = AWS::S3.new

# create a bucket
b = s3.buckets.create(bucket_name)

# upload a file
file_name = "../public/images/001.jpg"
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

http  =  Product.create(name: "Web text",
                        description: "Web browser address bar",
                        price: 1.99,
                        retired: false
                       )
http.image = o
http.categories << computer
http.save!

puts http.image.url



