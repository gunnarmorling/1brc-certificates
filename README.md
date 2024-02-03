# Scripts for 1BRC Generating Certificates

Each participant of [1BRC](https://github.com/gunnarmorling/1brc) gets a certificate with their name and result.
These scripts extract the results from the leaderboard and generate the certificate PDFs.

* Extract results:

```
ruby certificates_get_times.rb > results.txt
```

* Copy and paste the resulting values into a Numbers spreadsheet with two columns "Name" and "Time".

* Load _certificate_template.pages_ into Pages and run the "mail merge" against the spreadsheet.

* Export out of Pages into a PDF file certificates.pdf

* Split up the PDF into one file per certificate:

```
pdfseparate certificates.pdf staging/%d.pdf
```

* Update the leaderboard:

```
ruby certificates_add_pdfs.rb > leaderboard.txt
```

* Add the certificates for the entry of Thomas et al. by hand.

## License

This code base is available under the Apache License, version 2.
