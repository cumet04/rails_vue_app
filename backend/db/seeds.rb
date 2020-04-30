(1..5).each { |i|
  User.create!(email: "user#{i}@a.b.c", password: "password")
    .posts.create!(
      title: "user#{i}'s post",
      content: "user#{i}'s \"content\", with backslash\\, backquote`",
    )
}
User.second.delete!
