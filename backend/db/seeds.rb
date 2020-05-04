dummy_content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
"

(1..5).each do |i|
  User.create!(
    email: "user#{i}@a.b.c",
    password: "Password0",
    name: "user#{i}",
    biography: "My name is user#{i}",
  ).posts.create!(
    title: "user#{i}'s post",
    content: dummy_content,
  )
end

Post.all.each.with_index do |post, i|
  user_count = User.all.count
  i.times.each do |j|
    ui = (j % user_count) + 1
    post.comments.create!(
      content: "post#{i + 1}'s comment #{j}",
      author: User.find(ui),
    )
  end
end

User.second.delete!
