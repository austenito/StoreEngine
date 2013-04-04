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




