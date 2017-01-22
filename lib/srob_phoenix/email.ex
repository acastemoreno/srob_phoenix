defmodule SrobPhoenix.Email do
  use Bamboo.Phoenix, view: SrobPhoenix.EmailView

  def contacto_email(email, mensaje, nombre) do
    new_email()
    |> to("acastemoreno@gmail.com")
    |> from("postmaster@sandbox197a0e9c4dff4faa97980aa2594c367a.mailgun.org")
    |> subject("Mensaje Contacto desde pagina SROB-LatinAmerica")
    |> text_body(
      """
      Nombre: #{nombre}
      email: #{email}
      Mensaje: #{mensaje}
      """)
  end
end
