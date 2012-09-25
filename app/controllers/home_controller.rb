class HomeController < ApplicationController
  def index
    @rubygems_count  = SiteStats.active_gems
    @downloads_count = Download.count
    @latest          = SiteStats.latest_gems
    @downloaded      = Download.most_downloaded_today
    @updated         = SiteStats.latest_versions
  end
end
