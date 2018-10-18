class PagesController < ApplicationController

  def about
    @heading = 'step@net'

  end

  def contact
    @heading = 'почта для связи: dimadd@mail.ru'
  end

end
