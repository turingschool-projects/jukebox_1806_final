class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    song = Song.find(params[:song_id])
    @cart.add_song(song.id.to_s)
    session[:cart] = @cart.contents
    quantity = @cart.contents[song.id.to_s]

    flash[:notice] = "You now have #{pluralize(quantity, "copy")} of #{song.title} in your cart."
    redirect_to songs_path
  end

end
