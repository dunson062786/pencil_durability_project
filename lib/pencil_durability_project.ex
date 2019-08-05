defmodule PencilDurabilityProject do

  def sharpen([length: 1] = pencil) do
  # do wahtever
  end

  def sharpen(pencil) do
      KeywordList.update(pencil, :length, fn x -> x - 1)
  end

  def erase(pencil, pad) do
    
  end

  def edit(pencil, pad) do
    
  end

  def write(pencil, pad, text) do
    cond do
      calculateDurabilityLength(text) > pencil[:durability] -> {
        [
          {:max_durability, pencil[:max_durability]}, 
          {:durability, pencil[:durability] - calculateDurabilityLength(prefix(text, pencil[:durability]))}, 
          {:length, pencil[:length]}
        ], 
        pad <> String.pad_trailing(prefix(text, pencil[:durability]), String.length(text))
      }
      true -> {
        [
          {:max_durability, pencil[:max_durability]},
          {:durability, pencil[:durability] - calculateDurabilityLength(text)}, 
          {:length, pencil[:length]}
        ],
        pad <> text
      }
    end
  end
  
  defp calculateDurabilityLength(text) do
    numberOfLowercaseLetters = Regex.scan(~r/[a-z]/, text) |> Enum.count
    numberOfUppercaseLetters = Regex.scan(~r/[A-Z]/, text) |> Enum.count
    numberOfUppercaseLetters*2 + numberOfLowercaseLetters
  end

  defp prefix([first_letter | rest], durability_length) do
    first_letter_durability_length = calculateDurabilityLength(first_letter)
    cond do
      durability_length == 0 -> ""
      durability_length == 1 && first_letter_durability_length == 2 -> ""
      true -> "#{first_letter}#{prefix(rest, durability_length-first_letter_durability_length)}"
    end
  end

end
