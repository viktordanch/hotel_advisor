class CommentsController < ApplicationController
  def create

    @hotel = Hotel.find_by_id(params[:hotel_id])
    @comment = @hotel.comments.new(text: params[:text])
    @comment.user = current_user
    @comment.save
    render partial: 'hotels/comments'
  end
end
