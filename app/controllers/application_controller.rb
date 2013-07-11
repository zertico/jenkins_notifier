class ApplicationController < Zertico::Controller
  protect_from_forgery

  respond_to :html
end