Pagy::DEFAULT[:items] = 3

require 'pagy/extras/overflow'
Pagy::DEFAULT[:overflow] = :last_page

require 'pagy/extras/bootstrap'

Pagy::DEFAULT.freeze