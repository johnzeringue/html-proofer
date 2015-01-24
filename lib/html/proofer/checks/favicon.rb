# encoding: utf-8

class Favicon < ::HTML::Proofer::Checkable
  def rel
    @rel
  end
end

class FaviconRunner < ::HTML::Proofer::Runner

  def run
    @html.xpath('//link[not(ancestor::pre or ancestor::code)]').each do |favicon|
      favicon = Favicon.new favicon, self
      next if favicon.ignore?
      return if favicon.rel.split(' ').last.eql? 'icon'
    end

    add_issue 'no favicon specified'
  end

end
