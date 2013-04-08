#!/usr/bin/env ruby

class Game
  
  def initialize
    @user_choice = take_user_input() 
    if @user_choice == 'help'
      help()
    else
      @cpu_choice = take_cpu_input()
      play()
    end
  end
  
  def take_user_input
    print "\nIt's your turn, play something from <rock, paper, scissors, lizard, spock> or type <help>: "
    return gets.chomp.downcase
  end

  def take_cpu_input
    @choices = ['rock', 'paper', 'scissors', 'lizard', 'spock']
    return @choices[rand(5)]
  end

  def determine_winner

    if @user_choice == 'rock'
      if @cpu_choice == 'scissors' || @cpu_choice == 'lizard'
        return 'user'
      else
        return 'cpu'
      end

    elsif @user_choice == 'paper'
      if @cpu_choice == 'rock' || @cpu_choice == 'spock'
        return 'user'
      else
        return 'cpu'
      end

    elsif @user_choice == 'scissors'
      if @cpu_choice == 'paper' || @cpu_choice == 'lizard'
        return 'user'
      else
        return 'cpu'
      end

    elsif @user_choice == 'lizard'
      if @cpu_choice == 'paper' || @cpu_choice == 'spock'
        return 'user'
      else
        return 'cpu'
      end

    elsif @user_choice == 'spock'
      if @cpu_choice == 'rock' || @cpu_choice == 'scissors'
        return 'user'
      else
        return 'cpu'
      end

    else raise ArgumentError, "Choose something from #{@choices}"

    end

  end
  
  def play
    puts "\nYou chose #{@user_choice}."
    puts "I chose #{@cpu_choice}."
    winner = determine_winner()
    
    # Printing the winner
    puts "\nYou puny human! You shall never beat me!" if winner == 'cpu'
    puts "\nCongrats fleshbag, you have emerged victorious!" if winner == 'user'
    puts "\nGAME TIED: Triumph said 'NO' to both." if winner == nil
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
    self.initialize()
  end


end

game = Game.new

