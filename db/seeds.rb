### Users

User.create(:first_name => "Franklin", :last_name => "Webber", :email => "demoXX+franklin@jumpstartlab.com",
            :password => 'password', :password_confirmation => 'password')

User.create(:first_name => "Jeff", :last_name => "Casimir", :email => "demoXX+jeff@jumpstartlab.com",
            :password => 'password', :password_confirmation => 'password', :display_name => 'j3')
User.create(:first_name => "Steve", :last_name => "Klabnik", :email => "demoXX+steve@jumpstartlab.com",
            :password => 'password', :password_confirmation => 'password', :display_name => 'SkrilleX',
            :admin => true)

### Categories ###
people        = Category.create(name: "People")
architecture  = Category.create(name: "Architecture")
animals       = Category.create(name: "Animals")
abstract      = Category.create(name: "Abstract")
grayscale     = Category.create(name: "Grayscale")
computer      = Category.create(name: "Computer")
nature        = Category.create(name: "Nature")

### Products ###
http  =  Product.create(name: "http:",
                        description: "Web browser address bar",
                        price: 1.99,
                        retired: false
                       )
http.image =  File.open("public/images/001.jpg")
http.categories << computer
http.save

blue_string = Product.create(name: "Blue String",
                        description: "Blue lines of string",
                        price: 0.99,
                        retired: false
                       )
blue_string.image = File.open("public/images/002.jpg")
blue_string.categories << abstract
blue_string.save

full_moon = Product.create(name: "Full Moon",
                         description: "Silhouette of branches with full moon",
                         price: 2.99,
                         retired: false
                        )
full_moon.image = File.open("public/images/003.jpg")
full_moon.categories << nature
full_moon.save

kitten = Product.create(name: "Kitten",
                        description: "Kitten looking out window",
                        price: 1.99,
                        retired: false
                        )
kitten.image = File.open("public/images/004.jpg")
kitten.categories << animals
kitten.save

family = Product.create(name: "Family",
                        description: "Family with baby",
                        price: 0.99,
                        retired: false
                        )
family.image = File.open("public/images/005.jpg")
family.categories << people
family.categories << grayscale
family.save

branches = Product.create(name: "Branches",
                        description: "Curly branches",
                        price: 2.99,
                        retired: false
                        )
branches.image = File.open("public/images/006.jpg")
branches.categories << nature
branches.categories << abstract
branches.save

dock = Product.create(name: "Dock",
                        description: "Mountain lake with dock, boats",
                        price: 1.99,
                        retired: false
                        )
dock.image = File.open("public/images/007.jpg")
dock.categories << nature
dock.save

plug = Product.create(name: "Plug",
                        description: "Electrical plug",
                        price: 0.99,
                        retired: false
                        )
plug.image = File.open("public/images/008.jpg")
plug.categories << computer
plug.save

rooster = Product.create(name: "Rooster",
                        description: "Beautiful rooster on a farm",
                        price: 1.99,
                        retired: false
                        )
rooster.image = File.open("public/images/009.jpg")
rooster.categories << animals
rooster.save

steps = Product.create(name: "Steps",
                        description: "Curving steps",
                        price: 1.99,
                        retired: false
                        )
steps.image = File.open("public/images/010.jpg")
steps.categories << architecture
steps.categories << abstract
steps.save

high_tide = Product.create(name: "High Tide",
                        description: "Ocean waves at the beach",
                        price: 0.99,
                        retired: false
                        )
high_tide.image = File.open("public/images/011.jpg")
high_tide.categories << nature
high_tide.save

nebraska = Product.create(name: "Nebraska",
                        description: "Farmhouse and tree in winter",
                        price: 0.99,
                        retired: false
                        )
nebraska.image = File.open("public/images/012.jpg")
nebraska.categories << nature
nebraska.categories << architecture
nebraska.save

laughter = Product.create(name: "Laughter",
                        description: "Children laughing",
                        price: 0.99,
                        retired: false
                        )
laughter.image = File.open("public/images/013.jpg")
laughter.categories << people
laughter.categories << grayscale
laughter.save

glacier_rainbow = Product.create(name: "Glacier Rainbow",
                        description: "Glacier National Park",
                        price: 3.99,
                        retired: false
                        )
glacier_rainbow.image = File.open("public/images/014.jpg")
glacier_rainbow.categories << nature
glacier_rainbow.save

slice_of_lime = Product.create(name: "Slice of Lime",
                        description: "A slice of lime, with bubbles",
                        price: 1.99,
                        retired: false
                        )
slice_of_lime.image = File.open("public/images/015.jpg")
slice_of_lime.categories << abstract
slice_of_lime.save

mountains = Product.create(name: "Mountains",
                        description: "Mountains and lake",
                        price: 2.99,
                        retired: false
                        )
mountains.image = File.open("public/images/016.jpg")
mountains.categories << nature
mountains.save

tour_deiffel = Product.create(name: "Tour D'Eiffel",
                        description: "The Eiffel Tower in Paris",
                        price: 1.99,
                        retired: false
                        )
tour_deiffel.image = File.open("public/images/017.jpg")
tour_deiffel.categories << architecture
tour_deiffel.save

tree = Product.create(name: "Tree",
                        description: "Tree and grass in a breeze",
                        price: 0.99,
                        retired: false
                        )
tree.image = File.open("public/images/018.jpg")
tree.categories << nature
tree.save

door = Product.create(name: "Door",
                        description: "Blue door",
                        price: 0.99,
                        retired: false
                        )
door.image = File.open("public/images/019.jpg")
door.categories << architecture
door.save

motherboard = Product.create(name: "Motherboard",
                        description: "Close up of computer board",
                        price: 1.99,
                        retired: false
                        )
motherboard.image = File.open("public/images/020.jpg")
motherboard.categories << computer
motherboard.save

smoke = Product.create(name: "Smoke",
                        description: "Blue smoke",
                        price: 1.99,
                        retired: false
                        )
smoke.image = File.open("public/images/021.jpg")
smoke.categories << abstract
smoke.save

swirls = Product.create(name: "Swirls",
                        description: "Multi-colored swirls",
                        price: 2.99,
                        retired: false
                        )
swirls.image = File.open("public/images/022.jpg")
swirls.categories << abstract
swirls.save

binary = Product.create(name: "Binary",
                        description: "Computer binary code",
                        price: 1.99,
                        retired: false
                        )
binary.image = File.open("public/images/023.jpg")
binary.categories << computer
binary.categories << abstract
binary.save

mr_ed = Product.create(name: "Mr. Ed",
                        description: "A horse is a horse, of course, of course",
                        price: 0.99,
                        retired: false
                        )
mr_ed.image = File.open("public/images/024.jpg")
mr_ed.categories << animals
mr_ed.save

big_kitty = Product.create(name: "Big Kitty",
                        description: "Close up of tiger",
                        price: 2.99,
                        retired: false
                        )
big_kitty.image = File.open("public/images/025.jpg")
big_kitty.categories << animals
big_kitty.save

rain = Product.create(name: "Rain",
                        description: "Rain drops",
                        price: 2.99,
                        retired: false
                        )
rain.image = File.open("public/images/026.jpg")
rain.categories << nature
rain.categories << abstract
rain.categories << grayscale
rain.save

canoe = Product.create(name: "Canoe",
                        description: "Canoe on a lake",
                        price: 1.99,
                        retired: false
                        )
canoe.image = File.open("public/images/027.jpg")
canoe.categories << nature
canoe.save

brooklyn = Product.create(name: "Brooklyn",
                        description: "Brooklyn Bridge, New York",
                        price: 0.99,
                        retired: false
                        )
brooklyn.image = File.open("public/images/028.jpg")
brooklyn.categories << architecture
brooklyn.save

hello = Product.create(name: "Hello?",
                        description: "Raccoon peeking out",
                        price: 2.99,
                        retired: false
                        )
hello.image = File.open("public/images/029.jpg")
hello.categories << animals
hello.save

cool_as_ice = Product.create(name: "Cool as Ice",
                        description: "Polar Bear",
                        price: 1.99,
                        retired: false
                        )
cool_as_ice.image = File.open("public/images/030.jpg")
cool_as_ice.categories << animals
cool_as_ice.save

trail = Product.create(name: "Trail",
                        description: "Woman and girl skip down trail",
                        price: 0.99,
                        retired: false
                        )
trail.image = File.open("public/images/031.jpg")
trail.categories << people
trail.categories << nature
trail.save

coffee_break = Product.create(name: "Coffee Break",
                        description: "Laptop and coffee",
                        price: 1.99,
                        retired: false
                        )
coffee_break.image = File.open("public/images/032.jpg")
coffee_break.categories << computer
coffee_break.save

downtown = Product.create(name: "Downtown",
                        description: "Aerial view of a major city",
                        price: 0.99,
                        retired: false
                        )
downtown.image = File.open("public/images/033.jpg")
downtown.categories << architecture
downtown.save

green = Product.create(name: "Green",
                        description: "Green glow and hand",
                        price: 1.99,
                        retired: false
                        )
green.image = File.open("public/images/034.jpg")
green.categories << people
green.categories << abstract
green.save

fisherman = Product.create(name: "Fisherman",
                        description: "Portrait of a fisherman",
                        price: 2.99,
                        retired: false
                        )
fisherman.image = File.open("public/images/035.jpg")
fisherman.categories << people
fisherman.categories << grayscale
fisherman.save

office_space = Product.create(name: "Office Space",
                        description: "Boring man in boring office",
                        price: 0.09,
                        retired: false
                        )
office_space.image = File.open("public/images/036.jpg")
office_space.categories << people
office_space.save

amanita_muscaria = Product.create(name: "Amanita Muscaria",
                        description: "Wild mushroom",
                        price: 2.99,
                        retired: false
                        )
amanita_muscaria.image = File.open("public/images/037.jpg")
amanita_muscaria.categories << nature
amanita_muscaria.save

eagles_eye = Product.create(name: "Eagle's Eye",
                        description: "Bald Eagle",
                        price: 0.99,
                        retired: false
                        )
eagles_eye.image = File.open("public/images/038.jpg")
eagles_eye.categories << animals
eagles_eye.save

rose = Product.create(name: "Rose",
                        description: "Dusty blue rose",
                        price: 1.99,
                        retired: false
                        )
rose.image = File.open("public/images/039.jpg")
rose.categories << nature
rose.categories << abstract
rose.save

bubbles = Product.create(name: "Bubbles",
                        description: "Air bubbles in water",
                        price: 1.99,
                        retired: false
                        )
bubbles.image = File.open("public/images/040.jpg")
bubbles.categories << abstract
bubbles.save



