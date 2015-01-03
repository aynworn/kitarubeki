require 'rake/clean'

md_files = Rake::FileList["markdown/*.md"]

task :default => [ "html", :css, :main]

file "html" do
    mkdir "html"
end

task :css
CLEAN.include("html/*.css")

md_files.each do |sf|
    tf = sf.sub(%r'markdown/(\d\d\-\d\d|\d\d).*\.md','html/\1.html')
    task :main => tf
    file tf => sf do
        sh "pandoc -s -c ./style.css '#{sf}' -o '#{tf}'"
    end
end
CLEAN.include("html/*.html")