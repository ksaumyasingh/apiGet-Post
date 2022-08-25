defmodule ExrestWeb.PostView do
  use ExrestWeb, :view
  def render("ack.json", %{success: success, message: message}) do
    %{success: success, message: message}
  end
  def render("errors.json", %{errors: errors}) do
    %{success: false, errors: errors}
  end
  def render("error.json", %{error: error}) do
    %{success: false, error: error}
  end

  def render("data.json", %{success: success, data: data}) do
    %{success: success, data: data}
  end
end
