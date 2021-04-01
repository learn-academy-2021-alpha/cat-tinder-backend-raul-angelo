cats = [
  {
    name: 'Bob',
    age: 2,
    enjoys: 'Likes to eat shoes.'
  },
  {
    name: 'Myla',
    age: 12,
    enjoys: 'Food mostly, really just food, lots of food.'
  },
  {
    name: 'Dozer',
    age: 5,
    enjoys: 'Likes bumping into things.'
  }
]

cats.each do |cat|
  Cat.create cat
  puts "creating cat: #{cat}"
end
