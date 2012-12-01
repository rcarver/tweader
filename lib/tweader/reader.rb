module Tweader
  # A wrapper around the Google Reader API.
  class Reader

    # The most useful docs I have found so far:
    # http://code.google.com/p/pyrfeed/wiki/GoogleReaderAPI

    # Initialize a new Reader.
    #
    # google_reader_api - GoogleReaderApi::Api.
    # label             - String the label used to filter entries. Only entries
    #                     with this label are returned.
    #
    def initialize(google_reader_api, label = 'tweader')
      @google_reader_api = google_reader_api
      @entry_api = EntryApi.new(google_reader_api)
      @label = label
    end

    # Get unread items from the label.
    #
    # limit - Integer the maxium number of items to return.
    #
    # Returns an Array of Tweader::ReaderItem.
    def unread_items(limit = 5)
      # Find labeled items, excluding read items.
      label = "atom/user/-/label/#{CGI.escape @label}"
      filter = "user/-/state/com.google/read"
      order = "o" # oldest first
      response = @google_reader_api.get_link label, :n => limit, :xt => filter, :r => order
      @entry_api.entries(response).map { |e| Tweader::ReaderItem.new(e, @entry_api) }
    end

    # This class uses GoogleReaderApi to do some work, but lets us work with
    # RSS::Atom::Entry objects directly.
    class EntryApi

      def initialize(api)
        @api = api
      end

      # Returns an Array of RSS::Atom::Entry.
      def entries(atom_feed)
        RSS::Parser.parse(atom_feed.force_encoding('utf-8')).entries
      end

      # Add a tag to an entry.
      #
      # entry - RSS::Atom::Entry.
      # tag   - String tag name.
      #
      # Returns nothing.
      def tag_entry(entry, tag)
        # Get an XSRF token.
        # https://groups.google.com/forum/?fromgroups=#!searchin/fougrapi/edit-tag$20read/fougrapi/mbW1Gl9An_c/C6vlTUFxpiEJ
        # http://code.google.com/p/google-reader-api/wiki/ActionToken
        action_token = @api.get_link "api/0/token"
        args = {
          # The tag to add.
          :a => tag,
          # The ID of the entry
          :i => entry.id.content.to_s,
          # The ID of the stream.
          :s => entry.source.id.content.to_s[/feed\/.*/, 0],
          # The XSRF token.
          :T => action_token
        }
        @api.post_link "api/0/edit-tag", args
      end
    end
  end
end

