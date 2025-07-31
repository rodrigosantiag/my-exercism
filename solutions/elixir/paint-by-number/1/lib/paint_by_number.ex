defmodule PaintByNumber do
  def palette_bit_size(color_count) do
    calculate_size(color_count)
  end

  def empty_picture(), do: <<>>

  def test_picture() do
    <<0::2, 1::2, 2::2, 3::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    pallete_size = palette_bit_size(color_count)
    value = <<pixel_color_index::size(pallete_size)>>
    <<value::bitstring, picture::bitstring>>
  end

  def get_first_pixel(picture, color_count) do
    case picture do
      "" -> nil
      _ ->
        pallete_size = palette_bit_size(color_count)
        <<value::size(pallete_size), _rest::bitstring>> = picture
        value
    end
  end

  def drop_first_pixel(picture, color_count) do
    case picture do
      "" -> <<>>
      _ ->
        pallete_size = palette_bit_size(color_count)
        <<_value::size(pallete_size), rest::bitstring>> = picture
        rest
    end
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end

  defp calculate_size(color_count, result \\ 1) do
    cond do
      Integer.pow(2, result) < color_count -> calculate_size(color_count, result + 1)
      true -> result
    end
  end
end
