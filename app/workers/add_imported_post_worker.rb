class AddImportedPostWorker
  include Sidekiq::Worker

  def perform(post, current_user_id)
    current_user = User.find(current_user_id)
    parsed_data = Nokogiri::HTML5(post)

    posts = parsed_data.search('article').map do |p|
      title = p.search('h1').text
      body = p.search('main').to_html
      tag_list = p.search('em').text

      @post = Post.new(title: title, body: body, tag_list: tag_list, user: current_user)
      @post.save!
    end
  end
end
