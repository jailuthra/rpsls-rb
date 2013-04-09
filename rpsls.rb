#!/usr/bin/env ruby

# Copyright 2013 Jai Luthra <me@jailuthra.in>
# The code is licensed under MIT License. See the LICENSE file for details

class InvalidChoiceError < StandardError
end

class Game
  def take_user_input
    print "\nIt's your turn, play something from <rock, paper, scissors, lizard, spock> or type <help>: "
    return gets.chomp.downcase
  end

  def take_cpu_input
    @choices = ['rock', 'paper', 'scissors', 'lizard', 'spock']
    return @choices[rand(5)]
  end

  def determine_winner
    case @user_choice
    when 'rock'
      if @cpu_choice == 'scissors' || @cpu_choice == 'lizard'
        'user'
      else
        'cpu'
      end
    when 'paper'
      if @cpu_choice == 'rock' || @cpu_choice == 'spock'
        'user'
      else
        'cpu'
      end
    when 'scissors'
      if @cpu_choice == 'paper' || @cpu_choice == 'lizard'
        'user'
      else
        'cpu'
      end
    when 'lizard'
      if @cpu_choice == 'paper' || @cpu_choice == 'spock'
        'user'
      else
        'cpu'
      end
    when 'spock'
      if @cpu_choice == 'rock' || @cpu_choice == 'scissors'
        'user'
      else
        'cpu'
      end
    else 
      raise InvalidChoiceError, "Choose something from #{@choices}"
    end 
  end 
  
  def play
    @user_choice = take_user_input()
    help() if @user_choice == 'help'
    @cpu_choice = take_cpu_input()
    puts "\nYou chose #{@user_choice}."
    puts "I chose #{@cpu_choice}."
    winner = determine_winner()
    # Printing the winner
    case winner
    when 'cpu'
      puts "\nYou puny human! You shall never beat me!"
    when 'user'
      puts "\nCongrats fleshbag, you have emerged victorious!"
    else
      puts "\nGAME TIED: Triumph said 'NO' to both."
    end
  end
  
  def help
    puts "Scissors cut paper" \
    "\nPaper covers rock" \
    "\nRock crushes lizard" \
    "\nLizard poisons Spock" \
    "\nSpock smashes (or melts) scissors" \
    "\nScissors decapitate lizard" \
    "\nLizard eats paper" \
    "\nPaper disproves Spock" \
    "\nSpock vaporizes rock" \
    "\nRock breaks scissors \n" 
    exit()
  end

end

game = Game.new
game.play()
