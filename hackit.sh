find . -type f -name "*.html" -print0 | xargs -0 sed -i 's/"\/^\[\\w -\.*\]\*\$\/"/"\/^\[\\w -\.*\\u4e00-\\u9fa5\]\*\$\/"/g'
