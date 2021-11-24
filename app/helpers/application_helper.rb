module ApplicationHelper
    include Pagy::Frontend

    def active_class(link_path)
        current_page?(link_path) ? "active" : ""
    end

    def show_tags(post)
        raw post.tags.map(&:name).map { |t| link_to t, tag_path(t), class: 'standard-link' }.join(', ')
    end
end
