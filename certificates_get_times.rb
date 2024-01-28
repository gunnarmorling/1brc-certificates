leaderboard = `tail -n+44 README.md | head -n 147`.split("\n")

leaderboard.each do |entry|
    begin
        file = entry.split("|")[3].match(/src.*[.]java/)[0]
        
        fork = File.basename(file, ".java").sub("CalculateAverage_", "")
        usesUnsafe = `grep -F theUnsafe #{file}`.length > 0
    
        notes = entry.split("|")[6]
        new_notes = notes.chop
        new_notes += ", " unless new_notes.match(/^ *$/)
        new_notes += "uses Unsafe" if usesUnsafe
        new_notes += " "
    
        new_entry = entry.split("|")
        new_entry[6] = new_notes

        time = entry.split("|")[2]
        user = entry.split("|")[5].match(/\[(.*)\]/)[1]
        puts user + "," + time
        # puts new_entry.join("|") + "|"
    rescue
        puts entry
        fail
    end
end