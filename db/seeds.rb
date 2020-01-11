# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_list = [
  ['Aleks', 'Petrov', 'test1@mail.com', '111111', 'admin' ],
  ['Ivan', 'Sidorov', 'test2@mail.com', '111111', 'user' ],
  ['Sergey', 'Ivanov', 'test3@mail.com', '111111', 'user' ]
]

user_list.each do |name, surname, email, password, role|
  User.create( name: name, surname: surname, email: email, password: password, role: role )
end

23.times do |number|
  Advertisement.create( user_id: 2, title: "Lorem Ipsum #{number + 1}",
                        content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sit amet aliquet enim, eu aliquet est. Proin fringilla fermentum scelerisque. Nulla maximus, ligula a laoreet convallis, erat erat interdum diam, ut hendrerit tellus lacus id mi. Suspendisse potenti. Sed condimentum turpis eu lorem faucibus, id pulvinar risus lacinia. Nam euismod consequat augue eget efficitur. Quisque dapibus lacus nunc, facilisis blandit diam congue sit amet. Nunc eget eleifend nunc. Aliquam metus odio, tempor vel vestibulum eget, dictum a ante. Integer felis mauris, tincidunt sit amet turpis a, lacinia pharetra magna. Pellentesque aliquet elementum tempus. Integer aliquet elit aliquam sem ultricies, id molestie nunc mollis. Nunc justo erat, posuere nec ornare eget, scelerisque nec lacus.')
end
