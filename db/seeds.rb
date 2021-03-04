nana = User.create(
    username: "nana",
    password: "1234"
)

test = User.create(
    username: "test",
    password: "test"
)

puts "User seeded!"

first = Post.create(
    user_id: 1,
    content: "First post everrr on Skyup!"
)

# first.post_image.attach(
#     io: File.open('./public/post_images/001_cute_cat.jpg'),
#     filename: '001_cute_cat.jpg',
#     content_type: 'application/jpg'
# )

puts "Post seeded!"

Comment.create(
    post_id: 1,
    user_id: 1,
    comment: "Wow Cool!!!"
)

Comment.create(
    post_id: 1,
    user_id: 2,
    comment: "Nice Post!!! Nice to meet you btw!"
)


puts "Comment seeded!"