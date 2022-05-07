# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
photo_arr = [

	'https://avatars.dicebear.com/api/female/:seed.svg',
	'https://avatars.dicebear.com/api/male/:seed.svg',
	'https://avatars.dicebear.com/api/bottts/:seed.svg']

(1..6).each do |id|
	User.create(name: "User_#{id}",
		photo: photo_arr[rand(0..2)],
		bio: "Im User_#{id} Lorem ipsum dolor sit amet, consectetur adipiscing elit.
		Donec sed metus ac dui fermentum lacinia ac ac eros.
		Pellentesque efficitur nunc eget iaculis vestibulum.
		Fusce finibus fermentum sapien, mollis aliquam erat ullamcorper non.
		Nunc elementum consequat velit a egestas.
		Integer elementum neque in hendrerit maximus.
		Nullam tempor risus et nisl faucibus, at maximus tortor mollis.
		Quisque vitae est justo. Praesent consequat est neque, non accumsan mauris ornare at. ",
		post_counter: 0
	)
end

(1..20).each do |id|
	Post.create(author_id: rand(1..6),
	title: "Post_#{id}",
	text: "Duis dapibus, lectus eget viverra sagittis, ex lorem ullamcorper dui, nec dignissim lorem elit ac urna.
	Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut luctus felis magna, sed sollicitudin odio tempor vel.
	Ut mollis purus est, ut pulvinar libero ullamcorper eget. Nullam molestie arcu lobortis velit lacinia maximus. 
	Maecenas lacinia, elit faucibus aliquam tristique, erat dolor vehicula metus, vitae consequat sapien libero sit amet purus.
	Nulla sed magna egestas, tempus orci in, volutpat velit. Nam sed tristique libero, at convallis velit. In sagittis quis felis sit amet sagittis.
	Praesent consequat accumsan tincidunt. ",
	comments_counter: 0,
	likes_counter: 0
)
end

(1..50).each do |id|
	Comment.create(post_id: rand(1..20), author_id: rand(1..6), text: "Thi is the comment-#{id}")
end

(1..50).each do |id|
	Like.create(post_id: rand(1..20), author_id: rand(1..6))
end