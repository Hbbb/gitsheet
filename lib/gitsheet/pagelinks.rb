
class PageLinks

  SPLIT_LINKS = ','
  SPLIT_LINK = ';'

  def initialize(link)
    @links = {}

    link.split(PageLinks::SPLIT_LINKS).each do |link|
      section = link.split PageLinks::SPLIT_LINK

      raise 'Page Links could not be split on ;' if section.length < 2

      page_number = section[0].slice(section[0].length - 2, 1)
      page_relation = section[1].gsub(/rel="(.*)"/, '\1').lstrip

      @links[page_relation] = page_number
    end
  end

  def next
    @links['next'].to_i
  end

  def prev
    @links['prev'].to_i
  end

  def first
    @links['first'].to_i
  end

  def last
    @links['last'].to_i
  end

  def next?
    !!@links['next']
  end

  def prev?
    !!@links['prev']
  end

  def none?
    @links.empty?
  end

end
