#!/bin/bash

#Join Working Directory
cd $1

#Remove Old HTML Files
rm index.tmpl.html 2>/dev/null
rm pack.tmpl.html 2>/dev/null

#Fix CSS for Exported HTML
sed -i 's/assets\/bootstrap/..\/..\/assets\/bootstrap/g' pack.html
sed -i 's/assets\/css/..\/..\/assets\/css/g' pack.html

#Convert Exported HTML For Use In GoLang
mv index.html index.tmpl.html 2>/dev/null
mv pack.html pack.tmpl.html 2>/dev/null
