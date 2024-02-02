leaderboard = `tail -n+60 ../1brc/README.md | head -n 163`.split("\n")

leaderboard.each do |entry|
    begin
        file = entry.split("|")[3].match(/src.*[.]java/)[0]
        
        time = entry.split("|")[2]
        user = entry.split("|")[5].match(/\[(.*)\]/)[1]
        puts user + "," + time
        # puts new_entry.join("|") + "|"
    rescue
        puts entry
        fail
    end
end