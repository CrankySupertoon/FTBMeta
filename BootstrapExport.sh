#!/bin/bash

#Join Working Directory
cd $1

#Remove Old HTML Files
rm index.tmpl.html 2>/dev/null
rm pack.tmpl.html 2>/dev/null
rm pack_version.tmpl.html 2>/dev/null

#Remove Old Assets Folder
rm -rf /theme/static/assets

#Add New Assets Folder
mv /theme/tmpl/assets /theme/static/assets
mv /theme/tmpl/manifest.json /theme/static/manifest.json

#Fix Assets for Exported HTML
sed -i 's/assets\/bootstrap/..\/..\/assets\/bootstrap/g' pack.html
sed -i 's/assets\/css/..\/..\/assets\/css/g' pack.html
sed -i 's/assets\/img/..\/..\/assets\/img/g' pack.html
sed -i 's/assets\/bootstrap/..\/..\/..\/..\/assets\/bootstrap/g' pack_version.html
sed -i 's/assets\/css/..\/..\/..\/..\/assets\/css/g' pack_version.html
sed -i 's/assets\/img/..\/..\/..\/..\/assets\/img/g' pack_version.html

#Fix Header Links for Exported HTML
sed -i 's/index.html/..\/..\/index.html/g' pack.html
sed -i 's/index.html/..\/..\/..\/..\/index.html/g' pack_version.html

#Convert Exported HTML For Use In GoLang
mv index.html index.tmpl.html 2>/dev/null
mv pack.html pack.tmpl.html 2>/dev/null
mv pack_version.html pack_version.tmpl.html 2>/dev/null
