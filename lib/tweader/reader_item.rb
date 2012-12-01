module Tweader
  # The ReaderItem is a wrapper around a Google Reader Entry that exposes just
  # the parts we need.
  class ReaderItem

    # Initialize a new ReaderItem.
    #
    # atom      - RSS::Atom::Entry
    # entry_api - Tweader::Reader::EntryApi.
    #
    def initialize(atom, entry_api)
      @atom = atom
      @entry_api = entry_api
    end

    # Returns the String title of the item (the name of the blog post).
    def title
      @atom.title.content
    end

    # Returns the String title of the item's source (the name of the blog).
    def source_title
      @atom.source.title.content
    end

    # Returns the String URL of the item (the URL of the blog post).
    def link
      @atom.link.href
    end

    # Returns a Boolean whether or not the item has been read.
    def read?
      @atom.categories.any? { |c| c.label == "read" }
    end

    # Update that the entry has been tweeted. Internally this marks the item as
    # read within Google Reader.
    #
    # Returns nothing.
    def mark_tweeted!
      @entry_api.tag_entry(@atom, "user/-/state/com.google/read") unless read?
    end

    def inspect
      @atom.inspect
    end
  end
end


