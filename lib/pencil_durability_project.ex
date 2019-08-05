defmodule PencilDurabilityProject do

  def sharpen(pencil) do
    if pencil[:length] != 1 do
      [{:max_durability, pencil[:max_durability]}, {:durability, pencil[:max_durability]}, {:length, pencil[:length] - 1}]
    end
  end

  def erase(pencil, pad) do
    
  end

  def edit(pencil, pad) do
    
  end

  def write(pencil, pad, text) do
    cond do
      calculateLength(text) > pencil[:durability] -> {
        [
          {:max_durability, pencil[:max_durability]}, 
          {:durability, pencil[:durability] - calculateLength(prefix(text, pencil[:durability]))}, 
          {:length, pencil[:length]}
        ], 
        pad <> String.pad_trailing(prefix(text, pencil[:durability]), String.length(text))
      }
      true -> {[{:max_durability, pencil[:max_durability]}, {:durability, pencil[:durability] - calculateLength(text)}, {:length, pencil[:length]}], pad <> text}
    end
  end

  defp calculateLength(text) do
    numberOfLowercaseLetters = Regex.scan(~r/[a-z]/, text) |> Enum.count
    numberOfUppercaseLetters = Regex.scan(~r/[A-Z]/, text) |> Enum.count
    numberOfUppercaseLetters*2 + numberOfLowercaseLetters
  end

  defp prefix(text, length) do
    first_letter = String.at(text, 0)
    first_letter_length = calculateLength(first_letter)
    cond do
      length == 0 -> ""
      length == 1 && first_letter_length == 2 -> ""
      true -> "#{first_letter}#{prefix(String.slice(text, 1..-1), length-first_letter_length)}"
    end
  end

end
