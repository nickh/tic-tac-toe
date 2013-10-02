require 'spec_helper'

feature 'View the new game page', js: true do

  scenario 'user sees game board' do
    visit root_path
    sees_blank_board
  end

  scenario 'user clicks square sees x/o' do
    visit root_path
    play_a_turn_and_check_player(1, 'X')
    play_a_turn_and_check_player(2, 'O')
  end

  scenario 'user sees how many turns left' do
    visit root_path
    message_is_blank
    play_a_turn(1)
    see_message '8 turns left'
    play_a_turn(2)
    see_message '7 turns left'
  end

  scenario 'user sees winner' do
    visit root_path
    player_x_wins
  end

  scenario 'user sees draw' do
    visit root_path
    play_turns_and_see_message [5, 1, 0, 8, 2, 4, 7, 3, 6], 'Draw!'
  end

  scenario 'user clicks "Play Again" for new board' do
    visit root_path
    player_x_wins
    expect(page).to have_css "div#winner", text: /Play Again/
    click_link 'Play Again'
    sees_blank_board
  end


  def sees_blank_board
    message_is_blank
    (0..8).each do |i|
      expect(page).to have_css "input[name=grid_#{i}]", value: '_'
      expect(page).to have_css "div.square#grid_#{i}", text: ''
    end
  end

  def play_a_turn_and_check_player(square, player)
    play_a_turn(square)
    expect(page).to have_css "div.square#grid_#{square}", text: player
    expect(page).to have_css "input[name=grid_#{square}]", value: player
  end

  def play_a_turn(square)
    find("div#grid_#{square}").click
  end  

  def play_a_series_of_turns(turns)
    turns.each do |square|
      play_a_turn(square)
    end
  end

  def message_is_blank
    expect(page.find("div#winner").text).to be_blank
  end

  def see_message(message)
    expect(page).to have_css "div#winner", text: /#{message}/
  end

  def play_turns_and_see_message(turns, message)
    message_is_blank
    play_a_series_of_turns(turns)
    see_message(message)
  end

  def player_x_wins
    turns = [0, 3, 1, 4, 2]
    play_turns_and_see_message turns, 'X wins!'
    rest_of_squares_blanked(turns)
  end

  def rest_of_squares_blanked(turns)
    ((0..8).to_a - turns).each do |i|
      expect(page).to have_css "div.square#grid_#{i}", text: ' '
      expect(page).to have_css "input[name=grid_#{i}]", value: '_'
    end
  end

end