# frozen_string_literal: true

class Object
  # An object is present if it's not blank.
  def present?
    !blank?
  end
end

class Object
  # An object is blank if it's false, empty, or a whitespace string.
  # For example, +false+, '', '   ', +nil+, [], and {} are all blank.
  #
  # This simplifies
  #
  #   !address || address.empty?
  #
  # to
  #
  #   address.blank?
  #
  # @return [true, false]
  def blank?
    respond_to?(:empty?) ? !!empty? : !self
  end
end

module Jekyll
  class ExternalLinkTag < Liquid::Tag
    include Jekyll::Filters::URLFilters

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      @context = context

      link_text = nil
      link_href = nil
      link_lang = nil

      begin
        if @text.present?
          link_data = JSON.parse(@text)
          link_text = link_data["text"]
          link_href = link_data["link"]
          link_lang = link_data["language"]
        end
      rescue
        # Ignore if it's not a valid json
      end

      return unless link_text.present? && link_href.present?

      build_html(link_text, link_href, link_lang)
    end

    private

      def build_html(text, href, custom_lang)
        available_translations = { "pt" => "abre em uma nova janela", "en" => "opens in a new window" }
        lang = @context.registers[:site].config["lang"]
        lang = @context.registers[:page]["lang"] if @context.registers[:page]["lang"].present?
        lang = custom_lang if custom_lang.present?

        html = ""
        html += %(<a href="#{href}" target="_blank" rel="noopener">)
        html += text
        html += %( (#{available_translations[lang]} <i class="fa fa-window-restore" aria-hidden="true"></i>))
        html += "</a>"

        html
      end
  end
end

Liquid::Template.register_tag("external_link", Jekyll::ExternalLinkTag)
