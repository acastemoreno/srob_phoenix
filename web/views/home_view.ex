defmodule SrobPhoenix.HomeView do
  use SrobPhoenix.Web, :view

  def error?(nil) do
    nil
  end

  def error?(_) do
    "has-error"
  end
end
