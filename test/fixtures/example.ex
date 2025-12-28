defmodule Example.User do
  @moduledoc """
  A user in the system.
  """

  defstruct [:name, :email, :age]

  @type t :: %__MODULE__{
          name: String.t(),
          email: String.t(),
          age: non_neg_integer()
        }

  @doc """
  Creates a new user.
  """
  @spec new(String.t(), String.t(), non_neg_integer()) :: t()
  def new(name, email, age) do
    %__MODULE__{name: name, email: email, age: age}
  end

  @doc """
  Returns a greeting message.
  """
  @spec greet(t()) :: String.t()
  def greet(%__MODULE__{name: name}) do
    "Hello, #{name}!"
  end
end

defmodule Example do
  @moduledoc """
  Example module for LSP testing.
  """

  alias Example.User

  def main do
    user = User.new("Alice", "alice@example.com", 30)
    message = User.greet(user)
    IO.puts(message)
  end
end
