# frozen_string_literal: true

module Admin
  class DashboardController < BaseController

    def index
			@versions = PaperTrail::Version.all.order('id DESC')
		end

	end
end