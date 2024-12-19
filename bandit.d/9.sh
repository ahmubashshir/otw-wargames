sort data.txt | uniq -c | sed -nE '/^\s+1\s/s@^.+\s@@p'
