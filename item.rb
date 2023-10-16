class Item
    attr_accessor :id, :genre, :author, :source, :label, :publish_date, :archived
    
    def initialize (id,genre,author,source,label,publish_date,archived)
       @id = id
       @genre = genre
       @author = author
       @source = source
       @label = label
       @publish_date = publish_date
       @archived = archived
    end

    def can_be_archived?
        current_year = Date.today.year #Time.now.year.
        
    end

    def move_to_archive
        if can_be_archived
            @archived = true
        else
            @archived = false
        end
    end

end