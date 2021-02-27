User.create(
    username: "nana",
    password: "1234"
)

puts "User seeded!"

Post.create(
    user_id: 1,
    content: "First post everrr on Skyup!"
)

puts "Post seeded!"

Comment.create(
    post_id: 1,
    user_id: 1,
    comment: "Wow Cool!!!"
)

puts "Comment seeded!"