defmodule Jokenpo do
  @moduledoc """
  Documentation for `Jokenpo`.
  """

  @doc """

  """
  def main([]) do
    IO.puts "Please provide a value of 'rock', 'paper' or 'scissors'"
  end

  def main(argv) do
    argv
    |> parse_args
    |> determine_winner
    |> IO.puts
  end

  defp get_comp_move do
    Enum.random(["rock", "paper", "scissors"])
  end

  defp determine_winner({"paper", "rock"}) do
    print_result "paper"
  end

  defp determine_winner({"rock", "scissors"}) do
    print_result "rock"
  end

  defp determine_winner({"scissors", "paper"}) do
    print_result "scissors"
  end

  defp determine_winner({get_comp_move, player_move}) when get_comp_move == player_move do
    print_result get_comp_move, "It was a tie"
  end

  defp determine_winner({get_comp_move, _}) do
    "You win! Computer played #{get_comp_move}"
  end

  defp print_result(winner_move) do
    "You lost, computer played #{winner_move}"
  end

  defp print_result(winner_move, it_was_a_tie) do
    "#{it_was_a_tie} - you both played #{get_comp_move}"
  end

  defp parse_args(argv) do
    switches = [rock: :boolean, paper: :boolean, scissors: :boolean]
    parse = OptionParser.parse(argv, switches: switches)
    case parse do
      {[ {switch, true} ] , [player_move], _} ->
        {to_string(switch), player_move}
      {_, [player_move], _} ->
        {get_comp_move, player_move}
    end
  end
end
