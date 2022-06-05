defmodule Pattermatchgame do
  @moduledoc """
  Documentation for `Pattermatchgame`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Pattermatchgame.hello()
      :world

  """
  def hello do
    :world
  end
  def returnvalue({name,_}) do
    name
  end

  def returnvalues({name,value}) do
    {name,value}
  end

  def area({length,width}) do
    length * width
  end

  def area(%{length: inputlength,width: inputwidth}) do
    inputlength * inputwidth
  end

  def getmax(head,tail) when head >= tail do
    head
  end

  def getmax(_, tail) do
    tail
  end
  def getuserfromusermap(user) do
   with {:ok, login} <- extractlogin(user),
   {:ok, email} <- extractemail(user),
   {:ok, password} <- extractpassword(user) do
     {:ok, %{login: login, email: email, password: password}}
   end
  end
  def getuserfromusermap() do
    with {:error, _ } <- extractlogin(),
   {:error, _} <- extractemail(),
   {:error, _} <- extractpassword() do
     {:error, %{errormessage: "user not valid"}}
    end
  end
  defp extractlogin(%{login: login}), do: {:ok, login}
  defp extractlogin(%{password: _, email: _}), do: {:error, "login missing"}
  defp extractlogin(), do: {:error, "login missing"}
  defp extractemail(%{email: email}), do: {:ok, email}
  defp extractemail(), do: {:error, "login missing"}
  defp extractpassword(%{password: password}), do: {:ok, password}
  defp extractpassword(), do: {:error, "login missing"}
end
