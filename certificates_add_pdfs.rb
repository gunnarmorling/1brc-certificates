require 'fileutils'

leaderboard = `tail -n+45 README.md | head -n 146`.split("\n")
i = 1;
leaderboard.each do |entry|
    begin
        file = entry.split("|")[3].match(/src.*[.]java/)[0]
        fork = File.basename(file, ".java").sub("CalculateAverage_", "")

        new_entry = entry.split("|")
        new_entry << " [Certificate](certificates/" + fork + ".pdf) "
        puts new_entry.join("|") + "|"

        FileUtils.cp("certificates/" + i.to_s + ".pdf", "certificates/" + fork + ".pdf")
        i = i + 1
    rescue
        puts entry
        fail
    end
end