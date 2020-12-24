#!/bin/bash

#Remove Old HTML Files
rm theme/tmpl/index.tmpl.html 2>/dev/null
rm theme/tmpl/pack.tmpl.html 2>/dev/null
rm theme/tmpl/pack_version.tmpl.html 2>/dev/null

#Remove Old Assets Folder
rm -rf theme/static/

#Add New Assets Folder
mv theme/tmpl/assets theme/static/

#Fix Assets for Exported HTML
sed -i 's/assets\/bootstrap/..\/..\/assets\/bootstrap/g' "theme/tmpl/pack.html"
sed -i 's/assets\/css/..\/..\/assets\/css/g' "theme/tmpl/pack.html"
sed -i 's/assets\/img/..\/..\/assets\/img/g' "theme/tmpl/pack.html"
sed -i 's/assets\/bootstrap/..\/..\/..\/..\/assets\/bootstrap/g' "theme/tmpl/pack_version.html"
sed -i 's/assets\/css/..\/..\/..\/..\/assets\/css/g' "theme/tmpl/pack_version.html"
sed -i 's/assets\/img/..\/..\/..\/..\/assets\/img/g' "theme/tmpl/pack_version.html"

#Fix Header Links for Exported HTML
sed -i 's/index.html/..\/..\/index.html/g' "theme/tmpl/pack.html"
sed -i 's/index.html/..\/..\/..\/..\/index.html/g' "theme/tmpl/pack_version.html"

#Convert Exported HTML For Use In GoLang
mv "theme/tmpl/index.html" "theme/tmpl/index.tmpl.html" 2>/dev/null
mv "theme/tmpl/pack.html" "theme/tmpl/pack.tmpl.html" 2>/dev/null
mv "theme/tmpl/pack_version.html" "theme/tmpl/pack_version.tmpl.html" 2>/dev/null