# Creating the Certificates

* Extract results:

```
ruby certificates/certificates_get_times.rb > results.txt
```

* Copy and paste the resulting values into a spreadsheet.

* Load the template into Pages and run the "mail merge" against the spreadsheet.

* Split up the PDF into one file per certificate:

```
pdfseparate certificates/certificates.pdf certificates/%d.pdf
```

* Update the leaderboard:

```
ruby certificates/certificates_add_pdfs.rb.rb > leaderboard.txt
```

* Add the certificates for the entry of Thomas et al. by hand.
