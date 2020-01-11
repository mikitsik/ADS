class HomeController < ApplicationController

  AD_PER_PAGE = 5

  def index
    @pages = Advertisement.count / AD_PER_PAGE
    unless @pages.zero?
      @pages += 1
    end

    @page = permitted_page
    unless @page.zero?
      @page -= 1
    end

    @advertisements = Advertisement.offset(@page * AD_PER_PAGE).limit(AD_PER_PAGE)
  end

  private

  def permitted_page
    page = params.fetch(:page, 0).to_i
    page <= AD_PER_PAGE ? page : AD_PER_PAGE
  end
end
