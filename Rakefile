# vim: et ts=2 sw=2 sts=2

require 'pathname'

SRCDIR    = Dir.pwd
OUTPUTDIR = "output"
RESTFILES = FileList["**/*.rest"]
HTMLFILES = RESTFILES.ext('.html').map {|f| File.join OUTPUTDIR, f}

ENV['SHELL'] = SHELL = '/bin/sh'

def source_file striphead, ext
  proc do |t|
    s = Pathname.new t
    s = s.relative_path_from Pathname.new striphead
    s = s.sub_ext ext
    s.to_s
  end
end

def in_dir dir, &block
  cwd = Dir.pwd
  puts "cd #{dir}"
  Dir.chdir dir, &block
  puts "cd #{cwd}"
end

task :default => [:html]

task :html => [OUTPUTDIR] + HTMLFILES do
  in_dir OUTPUTDIR do
    sh 'cp', 'README.html', 'index.html'
    sh 'git', 'add', '-A', '.'
  end
end

task OUTPUTDIR do
  sh 'git', 'branch', '-tf', 'gh-pages', 'origin/gh-pages'
  sh 'git', 'clone', '-b', 'gh-pages', '.', OUTPUTDIR
  in_dir OUTPUTDIR do
    Dir.glob '*' do |entry|
      sh 'rm', '-r', entry
    end
  end
  sh 'cp', 'style.css', OUTPUTDIR
end

task :clobber do
  sh 'rm', '-rf', OUTPUTDIR
end

rule '.html' => source_file(OUTPUTDIR, '.rest') do |t|
  sh SHELL, 'tools/rst2html', t.source, t.name
end

