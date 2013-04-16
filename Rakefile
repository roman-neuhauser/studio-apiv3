# vim: et ts=2 sw=2 sts=2

RESTFILES = FileList["**/*.rest"]
HTMLFILES = RESTFILES.ext '.html'
CLOBBER = HTMLFILES

ENV['SHELL'] = SHELL = '/bin/sh'

task :default => [:html]

task :html => HTMLFILES

task :clobber do
  HTMLFILES.each do |f|
    sh 'rm', '-f', f
  end
end

rule '.html' => '.rest' do |t|
  sh SHELL, 'tools/rst2html', t.source, t.name
end

