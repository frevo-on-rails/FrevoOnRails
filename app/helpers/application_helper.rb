module ApplicationHelper
  def titulo(titulo_da_pagina)
    content_for(:titulo) do
      titulo_da_pagina
    end
  end
end
