class ApplicationController < Zertico::Controller
  self.responder = ApplicationResponder

  protect_from_forgery

  respond_to :html
end