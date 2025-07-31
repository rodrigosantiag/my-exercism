defmodule RPG do
  defmodule Character do
    defstruct health: 100, mana: 0
  end

  defmodule LoafOfBread do
    defstruct []
  end

  defmodule ManaPotion do
    defstruct strength: 10
  end

  defmodule Poison do
    defstruct []
  end

  defmodule EmptyBottle do
    defstruct []
  end

  defprotocol Edible do
    @doc """
    Alter character properties according to the edible item
    """
    @spec eat(
            %LoafOfBread{} | %ManaPotion{strength: integer()} | %Poison{},
            %Character{health: integer(), mana: integer()}
          ) :: {%EmptyBottle{} | nil, %Character{health: integer(), mana: integer()}}
    def eat(item, character)
  end

  defimpl Edible, for: LoafOfBread do
    @spec eat(%LoafOfBread{}, %Character{health: integer(), mana: integer()}) ::
            {nil, %Character{health: integer(), mana: integer()}}
    def eat(_item, character = %Character{}) do
      {nil, %{character | health: character.health + 5}}
    end
  end

  defimpl Edible, for: ManaPotion do
    @spec eat(%ManaPotion{strength: integer()}, %Character{health: integer(), mana: integer()}) ::
            {%EmptyBottle{}, %Character{health: integer(), mana: integer()}}
    def eat(item, character = %Character{}) do
      {%EmptyBottle{}, %{character | mana: character.mana + item.strength}}
    end
  end

  defimpl Edible, for: Poison do
    @spec eat(%Poison{}, %Character{health: integer(), mana: integer()}) ::
            {%EmptyBottle{}, %Character{health: 0, mana: integer()}}
    def eat(_item, character = %Character{}) do
      {%EmptyBottle{}, %{character | health: 0}}
    end
  end
end
