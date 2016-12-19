defmodule SrobPhoenix.LayoutView do
  use SrobPhoenix.Web, :view

  def css(nil, _conn) do
    nil
  end

  def css(true, conn) do
    render (view_module conn), "#{action_name conn}-css.html", conn: conn
  end

  def js(nil, _conn) do
    nil
  end

  def js(true, conn) do
    render (view_module conn), "#{action_name conn}-js.html", conn: conn
  end

  def handler_view_action(conn) do
    "#{view_module conn}.#{action_name conn}"
  end

  def rendering_link(compare_action, actual_action, _link, texto) when compare_action==actual_action do
    render "michi.html", texto: texto
  end

  def rendering_link(_compare_action, _actual_action, link, texto) do
    render "path.html", texto: texto, link: link
  end
end
