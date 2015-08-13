class NewsCamp::HtmlReader
  include NewsCamp::Factory

  attr_accessor :url, :options

  def fetch_content(url, options={})
    self.url = url
    self.options = options
    raw_content = open(self.url, allow_redirections: :all) { |io| io.read }
    complete_url_in_content(raw_content)
    self
  end

  def content
    @doc.to_html
  end

  def site_images
    result = og_image
    return [result] if result.present?
    result = twitter_image 
    return [result] if result.present?
    images
  end

  def site_icon
    favicon
  end

  def site_title
    title
  end

  def site_keyword
    result = []
    @doc.xpath("//meta[@name='keywords']/@content").each do |attr|
      result << attr.value
    end
    result.join(",")
  end

  def site_description
    result = description
    return result if result.present?
    result = og_description
    return result if result.present?
    twitter_description
  end

  def description
    result = []
    @doc.xpath("//meta[@name='description']").each do |node|
      result << node['content']
    end
    result.join(",")
  end

  def title
    @doc.at('title').text
  end

  def favicon
    result = nil
    @doc.xpath("//link[@rel='shortcut icon']").each do |node|
      result = ensure_full_url(node['href'])
    end
    result
  end

  def images
    result = []
    @doc.search('img').each do |node|
      result << ensure_full_url(node['src'])
    end
    result
  end

  def og_image
    result = []
    @doc.xpath("//meta[@property='og:image']").each do |node|
      result << ensure_full_url(node['content'])
    end
    result.join(",")
  end

  def og_title
    result = []
    @doc.xpath("//meta[@property='og:title']").each do |node|
      result << node['content']
    end
    result.join(",")
  end

  def og_description
    result = []
    @doc.xpath("//meta[@property='og:description']").each do |node|
      result << node['content']
    end
    result.join(",")
  end

  def twitter_image
    result = []
    @doc.xpath("//meta[@name='twitter::image']").each do |node|
      result << ensure_full_url(node['content'])
    end
    result.join(",")
  end

  def twitter_title
    result = []
    @doc.xpath("//meta[@name='twitter::title']").each do |node|
      result << node['content']
    end
    result.join(",")
  end

  def twitter_description
    result = []
    @doc.xpath("//meta[@name='twitter::description']").each do |node|
      result << node['content']
    end
    result.join(",")
  end

  def domain
    uri = URI(self.url)
    "#{uri.scheme}://#{uri.host}"
  end

  private

  def complete_url_in_content(raw_content)
    @doc = Nokogiri::HTML(raw_content)

    @doc.search('link,a,img').each do |node|
      attr_name = (node.name == 'a' ? 'src' : 'href')
      node[attr_name] = ( domain + node[attr_name]) if valid_relative_url(node[attr_name])
    end
  end

  def valid_relative_url(url)
    !url.blank? && !url.include?("//") && !url.start_with?("#")
  end

  def ensure_full_url(url)
    valid_relative_url(url) ? (domain + url) : url
  end


end