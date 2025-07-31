defmodule HighSchoolSweetheart do
  def first_letter(name) do
    String.trim(name) |> String.replace(~r/\s+/, "") |> String.at(0)
  end

  def initial(name) do
    String.upcase(first_letter(name)) <> "."
  end

  def initials(full_name) do
    name_splitted = String.split(full_name, " ")
    first_name = hd(name_splitted)
    last_name = hd(tl(name_splitted))

    initial(first_name) <> " " <> initial(last_name)
  end

  def pair(full_name1, full_name2) do
    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{initials(full_name1)}  +  #{initials(full_name2)}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end
