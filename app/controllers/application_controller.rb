class ApplicationController < ActionController::Base
  protect_from_forgery

  require_dependency 'game'
  require_dependency 'organism'
  require_dependency 'planet'
end
