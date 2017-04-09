module Slugifiable

	module ClassMethods
		def find_by_slug(name)
			self.all.find { |obj| obj.slug == name }
		end
	end

	module InstanceMethods
		def slug
			name.strip.downcase.gsub(/[\s\.\/\\]/, '-').tr('$','s').gsub(/[^\w+-]/, '').gsub(/[-_]{2,}/, '-').gsub(/^[-_]/, '').gsub(/[-_]$/, '')
		end
	end

end

