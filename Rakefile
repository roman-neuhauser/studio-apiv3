# vim: et ts=2 sw=2 sts=2

require 'pathname'

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

task :default => [:html]

task :html => [OUTPUTDIR] + HTMLFILES

task OUTPUTDIR do
  sh 'mkdir', '-p', OUTPUTDIR
end

task :clobber do
  sh 'rm', '-r', OUTPUTDIR if File.exists? OUTPUTDIR
end

rule '.html' => source_file(OUTPUTDIR, '.rest') do |t|
  sh SHELL, 'tools/rst2html', t.source, t.name
end

