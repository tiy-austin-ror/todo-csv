require_relative 'assignment_helper'
require 'csv'

class Todo
  include AssignmentHelper

  def initialize(file_name)
    @file_name = file_name #Don't touch this line or var
    # You will need to read from your CSV here and assign them to the @todos variable. make sure headers are set to true
    @todos = CSV.read(@file_name, {headers: true})
  end

  def start
    loop do
      system('clear')

      puts "---- TODO.rb ----"

      view_todos

      puts
      puts "What would you like to do?"
      puts "1) Exit 2) Add Todo 3) Mark Todo As Complete"
      print " > "
      action = get_input.to_i
      case action
      when 1 then exit
      when 2 then add_todo
      when 3 then mark_todo
      else
        puts "\a"
        puts "Not a valid choice"
      end
    end
  end

  def view_todos
    puts "Unfinished"
    @todos.each_with_index do |todo, index|
      puts "#{index + 1}) #{todo["name"]}"
    end
    puts "Completed"
  end

  def add_todo
  end

  def mark_todo
  end

  def todos
    @todos
  end

  private # Don't edit the below methods, but use them to get player input and to save the csv file
  def get_input
    STDIN.gets.chomp
  end

  def save!
    File.write(@file_name, @todos.to_csv)
  end
end
