#!/usr/bin/env ruby
# create symlinks from home dir to dot files under ~/vimfiles
# ignore files below:
#   .git

require "fileutils"

target_dir = Dir.home + "/vimfiles/"
src_dir = Dir.home + "/"
Dir.chdir(target_dir)
Dir.glob('.*').each do |file|
  if (file != "." && file != ".." && file != ".git")
    src_path = src_dir + file
    target_path = target_dir + file
    if File.exists?(src_path)
      FileUtils.rm_rf(src_path)
      puts "#{src_path} exists already, just deleted"
    end
    puts "create symlink: #{src_path}"
    `ln -s #{target_path} #{src_path}`
  end
end
