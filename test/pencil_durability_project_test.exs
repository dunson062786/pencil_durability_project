defmodule PencilDurabilityProjectTest do
  use ExUnit.Case
  doctest PencilDurabilityProject

  test "sharpening reduces the length of the pencil by one and resets its durability" do
    pencil = [{:max_durability, 40_000}, {:durability, 5}, {:length, 5}]
    assert PencilDurabilityProject.sharpen(pencil) == [{:max_durability, 40_000}, {:durability, 40_000}, {:length, 4}]
  end

  test "sharpening a pencil of length one gets rid of the pencil" do
    pencil = [{:max_durability, 40_000}, {:durability, 5}, {:length, 1}]
    assert PencilDurabilityProject.sharpen(pencil) == nil
  end

  test "writes text and decreases durability of pencil" do
    pencil = [{:max_durability, 40_000}, {:durability, 40_000}, {:length, 5}]
    pad = ""
    text = "text"
    assert PencilDurabilityProject.write(pencil, pad, text) == {[{:max_durability, 40_000}, {:durability, 39_996}, {:length, 5}], "text"}
  end

  test "write works on capital letters too" do
    pencil = [{:max_durability, 40_000}, {:durability, 40_000}, {:length, 5}]
    pad = ""
    text = "aaAb"
    assert PencilDurabilityProject.write(pencil, pad, text) == {[{:max_durability, 40_000}, {:durability, 39_995}, {:length, 5}], "aaAb"}
  end

end
