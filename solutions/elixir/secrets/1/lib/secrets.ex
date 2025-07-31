defmodule Secrets do
  def secret_add(secret) do
    function = fn adder -> 
      adder + secret
    end
  end

  def secret_subtract(secret) do
    function = fn subtracter ->
      subtracter - secret
    end
  end

  def secret_multiply(secret) do
    function = fn multiplier ->
      multiplier * secret
    end
  end

  def secret_divide(secret) do
    function = fn divider ->
      trunc(divider / secret)
    end
  end

  def secret_and(secret) do
    function = fn ander ->
      Bitwise.band(ander, secret)
    end
  end

  def secret_xor(secret) do
    function = fn xorer ->
      Bitwise.bxor(xorer, secret)
    end
  end

  def secret_combine(secret_function1, secret_function2) do
    function = fn param ->
      secret_function1.(param) |> secret_function2.()
    end
  end
end
