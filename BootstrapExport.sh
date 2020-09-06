#!/bin/bash
cd $1
rm index.tmpl.html 2>/dev/null
mv index.html index.tmpl.html 2>/dev/null
