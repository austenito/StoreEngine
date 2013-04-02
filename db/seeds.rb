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
                        price: 199.0,
                        retired: false
                       )
http.photo =  "/public/images/001.jpg"
http.save

string = Product.create(name: "String",
                        description: "Blue lines of string",
                        price: 99.0,
                        retired: false
                       )
full_moon = Product.create(name: "Full Moon",
                         description: "Silhouette of branches with full moon",
                         price: 299.0,
                         retired: false
                        )
