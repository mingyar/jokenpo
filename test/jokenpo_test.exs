defmodule JokenpoTest do
  use ExUnit.Case
  doctest Jokenpo

  test "greets the world" do
    assert Jokenpo.hello() == :world
  end
end
