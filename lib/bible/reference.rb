# Note to self: why not just create a BibleReference class? TODO: refactor..

module Bible
  def Bible::parse_reference(ref)
    # Note: doesn't really handle a range (doesn't span multiple chapters),
    #       also doesn't handle multiple references in one string
    #       also doesn't handle a whole chapter or range of chapters
    
    # Regular expression to capture each component of a contiguous bible verse reference (within one chapter).
    # Note: \u2013 and 2014 are en-dash and em-dash
    bible_verse_regex = %r{([a-zA-Z].+)\s(\d+):?(\d+)?\s*[\u2013\u2014]?\s*(\d+)?}

    ref.strip =~ bible_verse_regex

    ret = {
      book: $~.captures[0],
      chapter: $~.captures[1].to_i,
      verse: $~.captures[2].to_i
    }
    if $~.captures[3]
      ret[:chapter_end] = $~.captures[1].to_i 
      ret[:verse_end] = $~.captures[3].to_i
    end

    ret
  end
end