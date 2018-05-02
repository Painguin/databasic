import csv
import unicodedata
import re
import utils

with open('initial_data/languages.csv', encoding="utf8") as csvfile:
    reader = csv.reader(csvfile)
    next(reader)
    with open('cleaned_data/languages_cleaned.csv', 'w', encoding="utf8") as out:
        wr = csv.writer(out)
        added = set()
        for row in reader:
            clipid = row[0]
            l = acc(row[1])
            b = lettres(l)
            new_row = (clipid, b)
            if diff_letters(l, b) < 2 and len(b) != 0 and b.lower() != 'null' and new_row not in added:
                wr.writerow(new_row)
                added.add(new_row)
