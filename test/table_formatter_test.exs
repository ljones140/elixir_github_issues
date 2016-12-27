defmodule TableFormatterTest do
  use ExUnit.Case
  doctest Issues

  import Issues.TableFormatter, only: [format: 1]

  test "it returns the table with colums with equal columns" do
    assert format(data) == expected_table
  end

  def data do
    [
      %{"id" => 123, "title" => "I like monkies", "created_at" => "2013-03-16T22:03:13Z"},
      %{"id" => 124, "title" => "Cat is fat", "created_at" => "2013-04-16T22:03:13Z"}
    ]
  end

  def expected_table do
    """
    #   | created_at           | title         
    ----+----------------------+---------------
    123 | 2013-03-16T22:03:13Z | I like monkies
    124 | 2013-04-16T22:03:13Z | Cat is fat    
    """
   end

  test "the truth" do
    assert 1 + 1 == 2
  end
end
