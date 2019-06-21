add = Proc.new{|x, y| (x + y)}
p add[1, 2]

add = Proc.new do |x, y|
  x + y
end
p add[1,2]
full_name = -> (first, last) {first+ "XX" +last}
full_name["james", "meattey"]
p full_name.call("james", "meattey")
name = -> (first, last){first+ "**" +last}
p name["james", "meattey"]
def print_address (city:, state:, zip:)
  puts city
  puts state
  puts zip
end
print_address city: "allah", state: "NH", zip: "03820"
def print_names options={}
  puts options[:first]
  puts options[:middle]
  puts options[:last]
end
print_names first: "James", middle: "John", last: "meattey"
print_names first: "James", last: "Meattey"
def roster **players_positions
  players_positions.each do |player, position|
    puts "player name: #{player}"
    puts "player position: #{position}"
  end
end
data = {
  "James Meattey": "1st Base",
  "Alex Baldwin": "2nd Base",
  "Jean Hackman": "Short Stop"
}
roster data
teams_players = {
"marlins" =>{
  "james Meattey" => "first base",
  "Allen Rodriguez" => "SS",
  "My Dick" => "Your Mom",
},
"Red Sox" =>{
  "Jimmy Dean" => "first base",
  "Daddy Yankee" => "Slugger"
  }
}
teams_players.each do |team, players|
  puts team
  puts "************************"
  players.each do | player, position|
    puts player + " plays as " + position
  end
end
