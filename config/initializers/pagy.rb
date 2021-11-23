Pagy::DEFAULT[:items] = 3

require 'pagy/extras/overflow'
Pagy::DEFAULT[:overflow] = :last_page

Pagy::DEFAULT.freeze