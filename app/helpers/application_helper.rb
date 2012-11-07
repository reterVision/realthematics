module ApplicationHelper

  # Pageless function.
  def pageless(total_pages, url=nil, host=nil, container=nil)
    
    opts = {
        :totalPages => total_pages,
        :url        => url,
        :loaderMsg  => 'Loading more resources',
    }

    container && opts[:container] ||= container

    javascript_tag("$('##{host}').pageless(#{opts.to_json});")
  end

  # Pageless function - self-defined.
  def pageless_topics(total_pages, url=nil, element=nil, container=nil)
    
    opts = {
        :totalPages => total_pages,
        :url        => url,
        :loaderMsg  => 'Loading more resources',
    }

    element && opts[:element] ||= element
    container && opts[:container] ||= container

    javascript_tag("$('#real_topic_content').pageless_brandon(#{opts.to_json});")
  end
end
