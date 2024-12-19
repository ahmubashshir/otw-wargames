strings data.txt | sed -nE '/===+ [[:alnum:]]{10,}/s@^.+=\s+@@p'
