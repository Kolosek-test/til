class ChannelsController < ApplicationController

  before_action :require_admin, except: [:index, :show]

  helper_method :channel, :posts

  private

  def channel
    @channel ||= Channel.find_by_name!(params[:id])
  end

  def posts
    @posts ||= channel.posts.published_and_ordered.includes(:developer)
  end
end