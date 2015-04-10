class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper


helper_method :days_left, :zones

    def days_left(task)
  	  target = task.created_at + 8.days
      ((target - Time.now)/(3600*24)).to_i
    end
    def zones(task)
      if days_left(task) <= 0
        "<div style='display:none'>".html_safe
      elsif days_left(task) <= 2 
      	"<div class ='toDoList redZone' ".html_safe
      elsif days_left(task)  <= 4
        "<div class = 'toDoList yellowZone' ".html_safe
     else
     	"<div class = 'toDoList greenZone' ".html_safe
      end
    end
end
