module Slug
  module InstanceMethods

    def slug
      el_username= self.username
      slug = el_username.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end

  end

  module ClassMethods

    def find_by_slug(slug)
      @slug = slug
      format_slug_beginning
      results = self.where("username LIKE ?", @short_slug)
      results.detect do |result|
        result.slug === @slug
      end
    end

    def format_slug_beginning
      slug_beginning = @slug.split("-")[0]
      slug_beginning.prepend("%")
      slug_beginning << "%"
      @short_slug = slug_beginning
    end

  end

end
