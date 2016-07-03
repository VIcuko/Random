require 'pry'
def content(folder)
	Dir[folder+"/*"]
end

root = Dir.pwd
folders=content(Dir.pwd)
folders.each do |folder|
	if File.extname(folder)==""
		Dir.chdir(folder)
		fname = File.basename(folder)
		files=content(folder)
		counter=1
		files.each do |file|
			newfilename=fname+"_"+counter.to_s.rjust(3,"0")+File.extname(file)
			File.rename(file,newfilename)
			counter+=1
		end
	end
end