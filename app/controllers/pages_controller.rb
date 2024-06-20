class PagesController < ApplicationController
  before_action :authenticate_user!, only: :secret

  def home
    return unless user_signed_in?

    @presenter = HomepagePresenter.new(view_context)
  end

  def secret
  end
end
