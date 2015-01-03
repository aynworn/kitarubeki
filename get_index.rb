#!/usr/bin/env ruby
md_files = Dir['markdown/*.md']

puts <<"EOF"
<!DOCTYPE html>
<html>
<head>
</head>
<body>
EOF

system('pandoc markdown/00.md')

output = <<"EOF"
<h2>目次</h2>
<ul class=\"index\">\n
EOF

md_files.each do |md|
    if /(\d\d-\d\d)-(.*)\.md/ =~ md
        output << 
            <<"EOF"
    <li><a href="./#{$1}.html">#{$2}</li>
EOF
    end
end

output << '</ul>'

puts output

puts <<"EOF"
</body>
</html>
EOF