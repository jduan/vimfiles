#!/usr/bin/env ruby
# create symlinks from home dir to dot files under ~/vimfiles
# ignore files below:
#   .git

require "fileutils"

EXCLUDE_LIST = [ ".", "..", ".git", ".gitmodules" ]

HOME = ENV['HOME']
target_dir = HOME + "/vimfiles/"
src_dir = HOME + "/"
Dir.chdir(target_dir)
Dir.glob('.*').each do |file|
  unless EXCLUDE_LIST.include? file
    src_path = src_dir + file
    target_path = target_dir + file
    if File.exists?(src_path)
      FileUtils.rm_rf(src_path)
    end
    puts "create symlink: #{src_path}"
    `ln -s #{target_path} #{src_path}`
  end
end
