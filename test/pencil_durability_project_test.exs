defmodule PencilDurabilityProjectTest do
  use ExUnit.Case
  doctest PencilDurabilityProject

  test "writes text and decreases durability of pencil" do
    pencil = [{:durability, 40_000}, {:length, 5}]
    pad = ""
    text = "text"
    assert PencilDurabilityProject.write(pencil, pad, text) == {[{:durability, 39_996}, {:length, 5}], "text"}
  end

  test "write works on capital letters too" do
    pencil = [{:durability, 40_000}, {:length, 5}]
    pad = ""
    text = "aaAb"
    assert PencilDurabilityProject.write(pencil, pad, text) == {[{:durability, 39_995}, {:length, 5}], "aaAb"}
  end

end
