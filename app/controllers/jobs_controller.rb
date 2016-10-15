require 'httparty'

class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def dashboard
  end
end
