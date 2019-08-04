defmodule PencilDurabilityProject do

  def sharpen(pencil) do
    
  end

  def erase(pencil, pad) do
    
  end

  def edit(pencil, pad) do
    
  end

  def write(pencil, pad, text) do
    {[{:durability, pencil[:durability] - calculateLength(text)}, {:length, 5}], pad <> text}
  end

  defp calculateLength(text) do
    numberOfLowercaseLetters = Regex.scan(~r/[a-z]/, text) |> Enum.count
    numberOfUppercaseLetters = Regex.scan(~r/[A-Z]/, text) |> Enum.count
    numberOfUppercaseLetters*2 + numberOfLowercaseLetters
  end

end
