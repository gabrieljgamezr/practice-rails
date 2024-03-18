class ApplicationController < ActionController::Base
  include Language
  include Authorization
  include Authentication
  include Error
  include Pagy::Backend
end
