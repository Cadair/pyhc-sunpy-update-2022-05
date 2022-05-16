#!/bin/sh

index=./talk.org

oxreveal=$(find ~/.emacs.d/elpa/28.0/develop/ -type d -name "ox-reveal-*" -print -quit)

progn="(progn
  (package-initialize)
  (add-to-list 'load-path \"$oxreveal\")
  (require 'ox-reveal)
  (org-reveal-export-to-html))"

emacs --batch --visit "$index" --eval "$progn" --kill
sed -i 's/, multiplex]/]/' talk.html
sed -i 's/, multiplex]/]/' talk_client.html
