require 'rake/clean'

md_files = Rake::FileList["markdown/*.md"]

task :default => [ "html", :index, :css, :main]

file "html" do |d|
    mkdir d.name
end

task :css
CLEAN.include("html/*.css")

task :index => "html/index.html"
file "html/index.html" => "markdown/00.md" do |t|
    sh "./get_index.rb > #{t.name}"
end

md_files.each do |sf|
    if %r'markdown/(\d\d\-\d\d).*\.md' =~ sf
        tf = "html/#{$1}.html"
        task :main => tf
        file tf => sf do
            sh "pandoc -s -c ./style.css '#{sf}' -o '#{tf}'"
        end
    end
end
CLEAN.include("html/*.html")