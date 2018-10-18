class AutocompletesController < ApplicationController
  def posts
    term = params[:term]
    posts = Post.where("UPPER(title) like UPPER(?)", "%#{term}%")
    render  json: posts.map {|post| {value: post.id, label: post.title}}
  end

end
