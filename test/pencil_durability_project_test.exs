defmodule PencilDurabilityProjectTest do
  use ExUnit.Case
  doctest PencilDurabilityProject

  test "greets the world" do
    pencil = [{:durability, 40_000}, {:length, 5}]
    pad = ""
    text = "text"
    assert PencilDurabilityProject.write(pencil, pad, text) == {[{:durability, 39_996}, {:length, 5}], "text"}
  end
end
