#!/usr/bin/env ruby

class Game
  
  def take_user_input
    print "\nIt's your turn, play something (rock/paper/scissors): "
    @user_choice = gets.chomp.downcase
  end
  
  def take_cpu_input
    choices = ['rock', 'paper', 'scissors']
    @cpu_choice = choices[rand(3)]
  end

  def determine_winner
    winner = nil
    if @user_choice == 'rock'
      return winner = 'user' if @cpu_choice == 'scissors'
      return winner = 'cpu' if @cpu_choice == 'paper'      
    elsif @user_choice == 'paper'
      return winner = 'user' if @cpu_choice == 'rock'
      return winner = 'cpu' if @cpu_choice == 'scissors'
    elsif @user_choice == 'scissors'
      return winner = 'user' if @cpu_choice == 'paper'
      return winner = 'cpu' if @cpu_choice == 'rock'
    else raise ArgumentError, "Choose something from ['rock', 'paper', 'scissors']"
    end
  end
  
  def play
    self.take_user_input
    self.take_cpu_input
    puts "\nYou chose #{@user_choice}."
    puts "I chose #{@cpu_choice}."
    winner = self.determine_winner
    
    # Printing the winner
    puts "\nYou puny human! You shall never beat me!" if winner == 'cpu'
    puts "\nCongrats fleshbag, you have emerged victorious!" if winner == 'user'
    puts "\nGAME TIED: Triumph said 'NO' to both." if winner == nil
  end

end

game = Game.new
game.play
