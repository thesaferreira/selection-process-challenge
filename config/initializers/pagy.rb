Pagy::DEFAULT[:items] = 3

require 'pagy/extras/overflow'
Pagy::DEFAULT[:overflow] = :last_page

require 'pagy/extras/bootstrap'

Pagy::DEFAULT[:page_param] = :pagina
Pagy::I18n.load(locale: 'pt-BR')

Pagy::DEFAULT.freeze