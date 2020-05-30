# Write your code below game_hash

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here

# knows the number of points scored by each player (FAILED - 1)
def num_points_scored(player)
  game_hash.each do |k, team|
    team[:players].each do |e|
      if e[:player_name] == player
        return e[:points]
      end
    end
  end
end

# knows the shoe size of each player (FAILED - 2)
def shoe_size(player)
  game_hash.each do |k, team|
    team[:players].each do |e|
      if e[:player_name] == player
        return e[:shoe]
      end
    end
  end
end

# knows the Brooklyn Nets colors are Black and White (FAILED - 3)
# knows the Charlotte Hornets colors are Turquoise and Purple (FAILED - 4)
def team_colors(user_team_name)
  game_hash.each do |k, team|
    if team[:team_name] == user_team_name
      return team[:colors]
    end
  end
end

# returns the team names (FAILED - 5)
def team_names
  names = []
  game_hash.each do |k, team|
    names.push(team[:team_name])
  end
  names
end

# returns the player jersey numbers (FAILED - 6)
def player_numbers(user_team_name)
  numbers = []
  game_hash.each do |k, team|
    if team[:team_name] == user_team_name
      team[:players].each do |player|
        numbers.push(player[:number])
      end
    end
  end
  numbers
end

# returns all stats for a given player (FAILED - 7)
def player_stats(player)
  game_hash.each do |k, team|
    team[:players].each do |e|
      if e[:player_name] == player
        return e
      end
    end
  end
end

# returns the number of rebounds of the player with the biggest shoe size (FAILED - 8)
def big_shoe_rebounds
  biggest_shoe_size = 0
  player_rebounds = 0
  game_hash.each do |k, team|
    team[:players].each do |e|
      if e[:shoe] > biggest_shoe_size
        biggest_shoe_size = e[:shoe]
        player_rebounds = e[:rebounds]
      end
    end
  end
  player_rebounds
end


# ------ BONUS -------

# Which player has the most points?
def most_points_scored
  most_points = 0
  player = ""
  game_hash.each do |k, team|
    team[:players].each do |e|
      if e[:points] > most_points
        most_points = e[:points]
        player = e[:player_name]
      end
    end
  end
  player
end


# Which team has the most points?
def winning_team
  home_team_points = game_hash[:home][:players].sum { |e| e[:points] }
  away_team_points = game_hash[:away][:players].sum { |e| e[:points] }

  if home_team_points > away_team_points
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end

# Which player has the longest name?
def player_with_longest_name
  longest_name = ""
  game_hash.each do |k, team|
    team[:players].each do |e|
      if e[:player_name].length > longest_name.length
        longest_name = e[:player_name]
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  most_steals = 0
  player_with_most_steals = ""
  game_hash.each do |k, team|
    team[:players].each do |e|
      if e[:steals] > most_steals
        most_steals = e[:steals]
        player_with_most_steals = e[:player_name]
      end
    end
  end

  player_with_longest_name() == player_with_most_steals ? true : false
end
