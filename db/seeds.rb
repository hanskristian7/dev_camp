# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |topic|
    Topic.create!(
        title: "Topic: #{topic+1}"
    )
end

10.times do |blog|
    Blog.create!(
        title: "My Blog Post #{blog+1}",
        body: "Ruby on Rails, or Rails, is a server-side web application framework written in Ruby under the MIT License. Rails is a model–view–controller (MVC) framework, providing default structures for a database, a web service, and web pages. It encourages and facilitates the use of web standards such as JSON or XML for data transfer and HTML, CSS and JavaScript for user interfacing. In addition to MVC, Rails emphasizes the use of other well-known software engineering patterns and paradigms, including convention over configuration (CoC), don't repeat yourself (DRY), and the active record pattern.[4]",
        topic_id: Topic.last.id
    )
end
puts "10 blog posts created"

5.times do |skill|
    Skill.create!(
        title: "Rails #{skill}",
        percent_utilized: 15
    )
end
puts "5 skills created"

8.times do |portfolio|
    Portfolio.create!(
        title: "Portfolio title: #{portfolio}",
        subtitle: "Ruby on Rails",
        body: "Ruby on Rails' emergence in 2005 greatly influenced web app development, through innovative features such as seamless database table creations, migrations, and scaffolding of views",
        main_image: "https://place-hold.it/600x400",
        thumb_image: "https://place-hold.it/350x200"
    )
end

Portfolio.create!(
    title: "Portfolio title: Portfolio 8",
    subtitle: "Angular",
    body: "Ruby on Rails' emergence in 2005 greatly influenced web app development, through innovative features such as seamless database table creations, migrations, and scaffolding of views",
    main_image: "https://place-hold.it/600x400",
    thumb_image: "https://place-hold.it/350x200"
)
puts "9 skills created"

3.times do |technology|
    Portfolio.last.technologies.create!(
        name: "Technology #{technology+1}"
    )
end
puts "3 technologies created"
