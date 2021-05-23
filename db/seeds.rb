CLOUDINARY_IMAGES = [
  "https://res.cloudinary.com/dnzkxyfdv/image/upload/v1621204014/travellog/sample_1.jpg",
  "https://res.cloudinary.com/dnzkxyfdv/image/upload/v1621751832/travellog/sample_2.jpg",
  "https://res.cloudinary.com/dnzkxyfdv/image/upload/v1621751832/travellog/sample_3.jpg",
]

20.times do
  post = Post.create({
    title: Faker::Company.bs.titlecase,
    body: Faker::Lorem.paragraph_by_chars(number: 1000, supplemental: false)
  })

  post.build_eyecatch({
    image: CLOUDINARY_IMAGES[post.id % 3]
  })
end

user = User.create([
  {
    name: 'test',
    email: 'test@example.com',
    password: 'foobar',
    password_confirmation: 'foobar'
  }
])