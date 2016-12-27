defmodule Issues.TableFormatter do
  @date_length 20

  def format(data) do
    id_length = longest_id_length(data, "id")
    title_length = longest_title_length(data, "title")
    header = create_header(id_length, title_length)
    top_line = create_top_line(id_length, title_length)
    body = create_body(data, id_length, title_length)
    "#{header}#{top_line}#{body}"
  end

  defp longest_title_length(data, field) do
    Enum.max_by(data, &String.length(&1[field]))[field]
    |> String.length
  end

  defp longest_id_length(data, field) do
    Enum.max_by(data, &(String.length(Integer.to_string(&1[field]))))[field]
    |> Integer.to_string
    |> String.length
  end

  defp create_header(id_length, title_length) do
    "#{String.pad_trailing("#", id_length)} | #{String.pad_trailing("created_at", @date_length)} | #{String.pad_trailing("title", title_length)}\n"
  end

  defp create_top_line(id_length, title_length) do
    "#{String.duplicate("-", id_length)}-+-#{String.duplicate("-", @date_length)}-+-#{String.duplicate("-", title_length)}\n"
  end

  defp create_body(data, id_length, title_length) do
    Enum.map(data, fn(issue) ->
      "#{String.pad_trailing(Integer.to_string(issue["id"]), id_length)} | #{String.pad_trailing(issue["created_at"], @date_length)} | #{String.pad_trailing(issue["title"], title_length)}\n"
    end)
  end
end
