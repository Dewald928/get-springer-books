#!/usr/bin/env bash


#pdf2txt.py -m 5 /mnt/5A626440626422CD/OldBooks/10.1007@978-3-030-05900-2.pdf | isbn_stdin_validate

FILES=/mnt/5A626440626422CD/OldBooks/*
for f in $FILES
do
  echo $f
  mapfile -t ISBN < <( pdf2txt.py -m 10 "$f" | isbn_stdin_validate )
#  ISBN1=${ISBN[0]}
  echo ${ISBN[0]} # increment if error, try 0 and 1
  Title=$(isbn_meta ${ISBN[0]} | grep Title:)
  Title=${Title:7:${#Title}}
  echo ${Title}
#  break
  if [[ ${#Title} -eq 0 ]]; then
    echo "No title"
    continue
  fi
  TITLE_NO_WHITESPACE="$(echo -e "${Title}" | tr -d '[:space:]')"
  echo ${TITLE_NO_WHITESPACE}
  mv "$f" /mnt/5A626440626422CD/NewBooks/$TITLE_NO_WHITESPACE.pdf
#  break
done











