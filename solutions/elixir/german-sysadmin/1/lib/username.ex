defmodule Username do
  def sanitize(username) do
    result = ~c""

    # Enum.each(username, fn char ->

    #   if char >= 97 and char <= 122 do
    #     char
    #   end

    #   if char == 228 do
    #      ~c"ae"
    #   end

    #   if char == 246 do
    #     ~c"oe"
    #   end

    #   if char == 252 do
    #     ~c"ue"
    #   end

    #   if char == 223 do
    #     ~c"ss"
    #   end
    # end)
    result

    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss

    # Please implement the sanitize/1 function
  end
end
