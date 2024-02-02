require 'fileutils'

leaderboard = `tail -n+60 ../1brc/README.md | head -n 163`.split("\n")
i = 1;
leaderboard.each do |entry|
    begin
        file = entry.split("|")[3].match(/src.*[.]java/)[0]
        fork = File.basename(file, ".java").sub("CalculateAverage_", "")

        new_entry = entry.split("|")
        new_entry << " [Certificate](http://gunnarmorling.github.io/1brc-certificates/" + fork + ".pdf) "
        puts new_entry.join("|") + "|"

        FileUtils.cp("staging/" + i.to_s + ".pdf", "docs/" + fork + ".pdf")
        i = i + 1
    rescue
        puts entry
        fail
    end
end