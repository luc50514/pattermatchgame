defmodule PattermatchgameTest do
  use ExUnit.Case
  doctest Pattermatchgame

  test "greets the world" do
    assert Pattermatchgame.hello() == :world
  end

  test "gets the tuple of person" do
    assert Pattermatchgame.returnvalue({"John", 25}) == "John"
  end
  test "gets the tuple of person larry" do
    assert Pattermatchgame.returnvalue({"Larry", 26}) == "Larry"
  end

  test "gets the tuple of person larry and 26" do
    assert Pattermatchgame.returnvalues({"Larry", 26}) == {"Larry",26}
  end

  test "gets the area value 26 *26" do
    assert Pattermatchgame.area({26, 26}) == (26 * 26)
  end

  test "gets the area value 26 *26 of 676" do
    assert Pattermatchgame.area(%{length: 26, width: 26}) == 676
  end

  test "gets the max value of 1 and 2" do
    assert Pattermatchgame.getmax(1,2) == 2
  end

  test "gets the max value of 12 and 2" do
    assert Pattermatchgame.getmax(12,2) == 12
  end
  test "extract_user should return :ok and login value when present in user map" do
    assert Pattermatchgame.getuserfromusermap(%{email: "me@me.com", login: "rihood", password: "test"}) == {:ok, %{email: "me@me.com", login: "rihood", password: "test"}}
  end

  test "extract_user should return :error when user is removed" do
    assert Pattermatchgame.getuserfromusermap() == {:error, %{errormessage: "user not valid"}}
  end

  test "extract_user should return :error when login is removed" do
    assert Pattermatchgame.getuserfromusermap(%{email: "me@me.com", password: "test"}) == {:error, "login missing"}
  end
end
