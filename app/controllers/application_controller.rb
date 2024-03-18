class ApplicationController < ActionController::Base
  include Authorization
  include Authentication
  include Language
  include Error
  include Pagy::Backend
end
