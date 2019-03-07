Seller.transaction do
  Seller.delete_all
  Seller.create( :name => 'Dave', :address => "Dallas, TX")
  Seller.create( :name => 'Mary', :address => "San Jose, CA")
  Seller.create( :name => 'Bob', :address => "Seattle, WA")
  Seller.create( :name => 'John', :address => "Boston, MA")
end

Account.transaction do
  Account.delete_all
  Account.create( :email => 'dave@depot.com', :password => 'changeme', :password_confirmation => 'changeme', 
                  :accountable => Seller.find_by_name("Dave"))
  Account.create( :email => 'mary@depot.com', :password => 'changeme', :password_confirmation => 'changeme', 
                  :accountable => Seller.find_by_name("Mary"))
  Account.create( :email => 'bob@depot.com', :password => 'changeme', :password_confirmation => 'changeme', 
                  :accountable => Seller.find_by_name("Bob"))
  Account.create( :email => 'john@depot.com', :password => 'changeme', :password_confirmation => 'changeme', 
                  :accountable => Seller.find_by_name("John"))
end
Product.transaction do    
  Product.delete_all
# Products owned by Dave
  Product.create!(title: 'Agile Web Development with Rails 4',
    description: 
      %{<p>
        Rails just keeps on changing. Both Rails 3 and 4, as well as Ruby 1.9 and 2.0, 
        bring hundreds of improvements, including new APIs and substantial performance 
        enhancements. The fourth edition of this award-winning classic has been reorganized 
        and refocused so it's more useful than ever before for developers new to Ruby and Rails.
      </p>},
    image_url:   open('app/assets/images/agile.jpg'),    
    seller_id: Seller.find_by_name("Dave").id,
    price: 26.46)

   Product.create!(title: 'jQuery Mobile, Up and Running',
    description: 
      %{<p>
        By the time you finish this book, you'll know how to create responsive, 
        Ajax-based interfaces that work on a variety of smartphones and tablets, 
        using jQuery Mobile and semantic HTML5 code.
      </p>},
    image_url:   open('app/assets/images/jQuery-Mobile.jpg'),    
    seller_id: Seller.find_by_name("Dave").id,
    price: 19.21)

# Products owned by Mary
  Product.create!(title: 'Pragmatic Version Control Using Git',
    description: 
      %{<p>
        There's a change in the air. High-profile projects such as the Linux Kernel, 
        Mozilla, Gnome, and Ruby on Rails are now using Distributed Version Control Systems (DVCS) 
        instead of the old stand-bys of CVS or Subversion.
      </p>},
    image_url:   open('app/assets/images/git.jpg'),    
    seller_id: Seller.find_by_name("Mary").id,
    price: 18.03)

   Product.create!(title: 'CoffeeScript Programming with jQuery, Rails, and Node.js',
    description: 
      %{<p>
        Learn CoffeeScript programming with the three most popular web technologies around.
      </p>},
    image_url:   open('app/assets/images/coffeescript.jpg'),    
    seller_id: Seller.find_by_name("Mary").id,
    price: 26.99)

   Product.create!(title: 'CoffeeScript: Accelerated JavaScript Development',
    description: 
      %{<p>
        For 15 years, dynamic web content has been written in a single language: 
        JavaScript. Now, for the first time, programmers have an alternative that doesn't
         add an extra layer of abstraction or require plugins. CoffeeScript provides all
          of JavaScript's functionality wrapped in a cleaner, more succinct syntax that 
          encourages use of "the good parts" of the language.
      </p>},
    image_url:   open('app/assets/images/coffee-ajd.jpg'),    
    seller_id: Seller.find_by_name("Mary").id,
    price: 26.10)

# Products owned by Bob
  Product.create!(title: 'CoffeeScript',
    description:
      %{<p>
        CoffeeScript is JavaScript done right. It provides all of JavaScript's
  functionality wrapped in a cleaner, more succinct syntax. In the first
  book on this exciting new language, CoffeeScript guru Trevor Burnham
  shows you how to hold onto all the power and flexibility of JavaScript
  while writing clearer, cleaner, and safer code.
      </p>},
    image_url:   open('app/assets/images/cs.jpg'),
    seller_id: Seller.find_by_name("Bob").id,
    price: 36.00)

  Product.create!(title: 'Programming Ruby 1.9 & 2.0',
    description:
      %{<p>
        Ruby is the fastest growing and most exciting dynamic language
        out there. If you need to get working programs delivered fast,
        you should add Ruby to your toolbox.
      </p>},
    image_url: open('app/assets/images/ruby.jpg'),
    seller_id: Seller.find_by_name("Bob").id,
    price: 49.95)

  Product.create!(title: 'Rails Test Prescriptions',
    description:
      %{<p>
        <em>Rails Test Prescriptions</em> is a comprehensive guide to testing
        Rails applications, covering Test-Driven Development from both a
        theoretical perspective (why to test) and from a practical perspective
        (how to test effectively). It covers the core Rails testing tools and
        procedures for Rails 2 and Rails 3, and introduces popular add-ons,
        including Cucumber, Shoulda, Machinist, Mocha, and Rcov.
      </p>},
    image_url: open('app/assets/images/rtp.jpg'),
    seller_id: Seller.find_by_name("Bob").id,
    price: 34.95)   

# Products owned by John
  Product.create(title: 'Rails, Angular, Postgres, and Bootstrap',
    description:
      %{<p>
        <em>Powerful, Effective, and Efficient Full-Stack Web Development</em>
        As a Rails developer, you care about user experience and performance,
        but you also want simple and maintainable code. Achieve all that by
        embracing the full stack of web development, from styling with
        Bootstrap, building an interactive user interface with AngularJS, to
        storing data quickly and reliably in PostgreSQL. Take a holistic view of
        full-stack development to create usable, high-performing applications,
        and learn to use these technologies effectively in a Ruby on Rails
        environment.
        </p>},
    image_url: open('app/assets/images/dcbang.jpg'),
    seller_id: Seller.find_by_name("John").id,
    price: 45.00)

  Product.create(title: 'Seven Mobile Apps in Seven Weeks',
    description:
      %{<p>
        <em>Native Apps, Multiple Platforms</em>
        Answer the question “Can we build this for ALL the devices?” with a
        resounding YES. This book will help you get there with a real-world
        introduction to seven platforms, whether you’re new to mobile or an
        experienced developer needing to expand your options. Plus, you’ll find
        out which cross-platform solution makes the most sense for your needs.
        </p>},
    image_url: open('app/assets/images/7apps.jpg'),
    seller_id: Seller.find_by_name("John").id,
    price: 26.00)


  Product.create(title: 'Ruby Performance Optimization',
    description:
      %{<p>
        <em>Why Ruby Is Slow, and How to Fix It</em> 
        You don’t have to accept slow Ruby or Rails performance. In this
        comprehensive guide to Ruby optimization, you’ll learn how to write
        faster Ruby code—but that’s just the beginning. See exactly what makes
        Ruby and Rails code slow, and how to fix it. Alex Dymo will guide you
        through perils of memory and CPU optimization, profiling, measuring,
        performance testing, garbage collection, and tuning. You’ll find that
        all those “hard” things aren’t so difficult after all, and your code
        will run orders of magnitude faster.
        </p>},
    image_url: open('app/assets/images/adrpo.jpg'),
    seller_id: Seller.find_by_name("John").id,
    price: 46.00)  

end  
