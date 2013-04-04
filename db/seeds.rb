bucket_name = 'yaaagoat_dev'
s3 = AWS::S3.new

@b = s3.buckets[bucket_name]
def add_photo_to_product product, file_name
    object = @b.objects[file_name]
    product.image = object.url_for(:read)
end

### Users

User.create!(:first_name => "Franklin", :last_name => "Webber", :email => "demoXX+franklin@jumpstartlab.com",
            :password => 'password', :password_confirmation => 'password')

User.create!(:first_name => "Jeff", :last_name => "Casimir", :email => "demoXX+jeff@jumpstartlab.com",
            :password => 'password', :password_confirmation => 'password', :display_name => 'j3')
User.create!(:first_name => "Steve", :last_name => "Klabnik", :email => "demoXX+steve@jumpstartlab.com",
            :password => 'password', :password_confirmation => 'password', :display_name => 'SkrilleX',
            :admin => true)

### Categories ###
people        = Category.create!(name: "People")
architecture  = Category.create!(name: "Architecture")
animals       = Category.create!(name: "Animals")
abstract      = Category.create!(name: "Abstract")
grayscale     = Category.create!(name: "Grayscale")
computer      = Category.create!(name: "Computer")
nature        = Category.create!(name: "Nature")

### Products ###
http  =  Product.new(name: "http:",
                        description: "Web browser address bar",
                        price: 1.99,
                        retired: false
                       )
http.categories << computer
add_photo_to_product(http, "001.jpg")
http.save!

blue_string = Product.new(name: "Blue String",
                        description: "Blue lines of string",
                        price: 0.99,
                        retired: false
                       )
add_photo_to_product(blue_string, "002.jpg")
blue_string.categories << abstract
blue_string.save!

full_moon = Product.new(name: "Full Moon",
                         description: "Silhouette of branches with full moon",
                         price: 2.99,
                         retired: false
                        )
add_photo_to_product(full_moon, "003.jpg")
full_moon.categories << nature
full_moon.save!

kitten = Product.new(name: "Kitten",
                        description: "Kitten looking out window",
                        price: 1.99,
                        retired: false
                        )
add_photo_to_product(kitten, "004.jpg")
kitten.categories << animals
kitten.save!

family = Product.new(name: "Family",
                        description: "Family with baby",
                        price: 0.99,
                        retired: false
                        )
add_photo_to_product(family, "005.jpg")
family.categories << people
family.categories << grayscale
family.save!

branches = Product.new(name: "Branches",
                        description: "Curly branches",
                        price: 2.99,
                        retired: false
                        )
add_photo_to_product(branches, "006.jpg")
branches.categories << nature
branches.categories << abstract
branches.save!

dock = Product.new(name: "Dock",
                        description: "Mountain lake with dock, boats",
                        price: 1.99,
                        retired: false
                        )
add_photo_to_product(dock, "007.jpg")
dock.categories << nature
dock.save!

plug = Product.new(name: "Plug",
                        description: "Electrical plug",
                        price: 0.99,
                        retired: false
                        )
add_photo_to_product(plug, "008.jpg")
plug.categories << computer
plug.save!

rooster = Product.new(name: "Rooster",
                        description: "Beautiful rooster on a farm",
                        price: 1.99,
                        retired: false
                        )
add_photo_to_product(rooster, "009.jpg")
rooster.categories << animals
rooster.save!

steps = Product.new(name: "Steps",
                        description: "Curving steps",
                        price: 1.99,
                        retired: false
                        )
add_photo_to_product(steps, "010.jpg")
steps.categories << architecture
steps.categories << abstract
steps.save!

high_tide = Product.new(name: "High Tide",
                        description: "Ocean waves at the beach",
                        price: 0.99,
                        retired: false
                        )
add_photo_to_product(high_tide, "011.jpg")
high_tide.categories << nature
high_tide.save!

nebraska = Product.new(name: "Nebraska",
                        description: "Farmhouse and tree in winter",
                        price: 0.99,
                        retired: false
                        )
add_photo_to_product(nebraska, "012.jpg")
nebraska.categories << nature
nebraska.categories << architecture
nebraska.save!

laughter = Product.new(name: "Laughter",
                        description: "Children laughing",
                        price: 0.99,
                        retired: false
                        )
add_photo_to_product(laughter, "013.jpg")
laughter.categories << people
laughter.categories << grayscale
laughter.save!

glacier_rainbow = Product.new(name: "Glacier Rainbow",
                        description: "Glacier National Park",
                        price: 3.99,
                        retired: false
                        )
add_photo_to_product(glacier_rainbow, "014.jpg")
glacier_rainbow.categories << nature
glacier_rainbow.save!

slice_of_lime = Product.new(name: "Slice of Lime",
                        description: "A slice of lime, with bubbles",
                        price: 1.99,
                        retired: false
                        )
add_photo_to_product(slice_of_lime, "015.jpg")
slice_of_lime.categories << abstract
slice_of_lime.save!

mountains = Product.new(name: "Mountains",
                        description: "Mountains and lake",
                        price: 2.99,
                        retired: false
                        )
add_photo_to_product(mountains, "016.jpg")
mountains.categories << nature
mountains.save!

tour_deiffel = Product.new(name: "Tour D'Eiffel",
                        description: "The Eiffel Tower in Paris",
                        price: 1.99,
                        retired: false
                        )
add_photo_to_product(tour_deiffel, "017.jpg")
tour_deiffel.categories << architecture
tour_deiffel.save!

tree = Product.new(name: "Tree",
                        description: "Tree and grass in a breeze",
                        price: 0.99,
                        retired: false
                        )
add_photo_to_product(tree, "018.jpg")
tree.categories << nature
tree.save!

door = Product.new(name: "Door",
                        description: "Blue door",
                        price: 0.99,
                        retired: false
                        )
add_photo_to_product(door, "019.jpg")
door.categories << architecture
door.save!

motherboard = Product.new(name: "Motherboard",
                        description: "Close up of computer board",
                        price: 1.99,
                        retired: false
                        )
add_photo_to_product(motherboard, "020.jpg")
motherboard.categories << computer
motherboard.save!

smoke = Product.new(name: "Smoke",
                        description: "Blue smoke",
                        price: 1.99,
                        retired: false
                        )
add_photo_to_product(smoke, "021.jpg")
smoke.categories << abstract
smoke.save!

swirls = Product.new(name: "Swirls",
                        description: "Multi-colored swirls",
                        price: 2.99,
                        retired: false
                        )
add_photo_to_product(swirls, "022.jpg")
swirls.categories << abstract
swirls.save!

binary = Product.new(name: "Binary",
                        description: "Computer binary code",
                        price: 1.99,
                        retired: false
                        )
add_photo_to_product(binary, "023.jpg")
binary.categories << computer
binary.categories << abstract
binary.save!

mr_ed = Product.new(name: "Mr. Ed",
                        description: "A horse is a horse, of course, of course",
                        price: 0.99,
                        retired: false
                        )
add_photo_to_product(mr_ed, "024.jpg")
mr_ed.categories << animals
mr_ed.save!

big_kitty = Product.new(name: "Big Kitty",
                        description: "Close up of tiger",
                        price: 2.99,
                        retired: false
                        )
add_photo_to_product(big_kitty, "025.jpg")
big_kitty.categories << animals
big_kitty.save!

rain = Product.new(name: "Rain",
                        description: "Rain drops",
                        price: 2.99,
                        retired: false
                        )
add_photo_to_product(rain, "026.jpg")
rain.categories << nature
rain.categories << abstract
rain.categories << grayscale
rain.save!

canoe = Product.new(name: "Canoe",
                        description: "Canoe on a lake",
                        price: 1.99,
                        retired: false
                        )
add_photo_to_product(canoe, "027.jpg")
canoe.categories << nature
canoe.save!

brooklyn = Product.new(name: "Brooklyn",
                        description: "Brooklyn Bridge, New York",
                        price: 0.99,
                        retired: false
                        )
add_photo_to_product(brooklyn, "028.jpg")
brooklyn.categories << architecture
brooklyn.save!

hello = Product.new(name: "Hello?",
                        description: "Raccoon peeking out",
                        price: 2.99,
                        retired: false
                        )
add_photo_to_product(hello, "029.jpg")
hello.categories << animals
hello.save!

cool_as_ice = Product.new(name: "Cool as Ice",
                        description: "Polar Bear",
                        price: 1.99,
                        retired: false
                        )
add_photo_to_product(cool_as_ice, "030.jpg")
cool_as_ice.categories << animals
cool_as_ice.save!

trail = Product.new(name: "Trail",
                        description: "Woman and girl skip down trail",
                        price: 0.99,
                        retired: false
                        )
add_photo_to_product(trail, "031.jpg")
trail.categories << people
trail.categories << nature
trail.save!

coffee_break = Product.new(name: "Coffee Break",
                        description: "Laptop and coffee",
                        price: 1.99,
                        retired: false
                        )
add_photo_to_product(coffee_break, "032.jpg")
coffee_break.categories << computer
coffee_break.save!

downtown = Product.new(name: "Downtown",
                        description: "Aerial view of a major city",
                        price: 0.99,
                        retired: false
                        )
add_photo_to_product(downtown, "033.jpg")
downtown.categories << architecture
downtown.save!

green = Product.new(name: "Green",
                        description: "Green glow and hand",
                        price: 1.99,
                        retired: false
                        )
add_photo_to_product(green, "034.jpg")
green.categories << people
green.categories << abstract
green.save!

fisherman = Product.new(name: "Fisherman",
                        description: "Portrait of a fisherman",
                        price: 2.99,
                        retired: false
                        )
add_photo_to_product(fisherman, "035.jpg")
fisherman.categories << people
fisherman.categories << grayscale
fisherman.save!

office_space = Product.new(name: "Office Space",
                        description: "Boring man in boring office",
                        price: 0.09,
                        retired: false
                        )
add_photo_to_product(office_space, "036.jpg")
office_space.categories << people
office_space.save!

amanita_muscaria = Product.new(name: "Amanita Muscaria",
                        description: "Wild mushroom",
                        price: 2.99,
                        retired: false
                        )
add_photo_to_product(amanita_muscaria, "037.jpg")
amanita_muscaria.categories << nature
amanita_muscaria.save!

eagles_eye = Product.new(name: "Eagle's Eye",
                        description: "Bald Eagle",
                        price: 0.99,
                        retired: false
                        )
add_photo_to_product(eagles_eye, "038.jpg")
eagles_eye.categories << animals
eagles_eye.save!

rose = Product.new(name: "Rose",
                        description: "Dusty blue rose",
                        price: 1.99,
                        retired: false
                        )
add_photo_to_product(rose, "039.jpg")
rose.categories << nature
rose.categories << abstract
rose.save!

bubbles = Product.new(name: "Bubbles",
                        description: "Air bubbles in water",
                        price: 1.99,
                        retired: false
                        )
add_photo_to_product(bubbles, "040.jpg")
bubbles.categories << abstract
bubbles.save!

### Orders ###

order1        = Order.new(user_id: "1", status: "pending")
order1.products << Product.first
order1.order_products.first.quantity = 1
order1.order_products.first.save!
order1.save!
order2        = Order.new(user_id: "1", status: "pending")
order2.products << Product.first
order2.order_products.first.quantity = 1
order2.order_products.first.save!
order2.save!
order3        = Order.new(user_id: "1", status: "paid")
order3.products << Product.first
order3.order_products.first.quantity = 1
order3.order_products.first.save!
order3.save!
order4        = Order.new(user_id: "1", status: "paid")
order4.products << Product.first
order4.order_products.first.quantity = 1
order4.order_products.first.save!
order4.save!
order5        = Order.new(user_id: "1", status: "shipped")
order5.products << Product.first
order5.order_products.first.quantity = 1
order5.order_products.first.save!
order5.save!
order6        = Order.new(user_id: "1", status: "shipped")
order6.products << Product.first
order6.order_products.first.quantity = 1
order6.order_products.first.save!
order6.save!
order7        = Order.new(user_id: "1", status: "cancelled")
order7.products << Product.first
order7.order_products.first.quantity = 1
order7.order_products.first.save!
order7.save!
order8        = Order.new(user_id: "1", status: "cancelled")
order8.products << Product.first
order8.order_products.first.quantity = 1
order8.order_products.first.save!
order8.save!
order9        = Order.new(user_id: "1", status: "returned")
order9.products << Product.first
order9.order_products.first.quantity = 1
order9.order_products.first.save!
order9.save!
order10        = Order.new(user_id: "1", status: "returned")
order10.products << Product.first
order10.order_products.first.quantity = 1
order10.order_products.first.save!
order10.save!



