if not http then
	error("HTTP API needs to be enabled")
end
if not term.isColor then
	error("For now, advanced computer required")
end
term.clear()
print()
print("CC-Git Bash")
print()
while true do
	term.setTextColor(colors.green)
	print(shell.resolve())
	term.setTextColor(colors.white)
	write("$ ")
	cmd = read()
	if not cmd:sub(1,3) == "git" then
		shell.run(cmd)
	else
		if s:sub(5,9) == "help" then
			print("# Welcome to CC-Git")
			print("# This is a alternative Git system")
			print("# This doesn't work with standard Git servers")
			print("# We hope that people can make CC-Git servers")
			print("# Visit PaperCrafter.tk for more info!")
			print("# Use git init to create an empty repo")
			print()
		elseif s:sub(5,9) == "init" then
			fs.makeDir(shell.resolve(".git"))
			fs.makeDir(shell.resolve(".git/branches"))
			fs.makeDir(shell.resolve(".git/config"))
			fs.makeDir(shell.resolve(".git/tracked"))
			print("Successfully initialised empty repo at "..shell.resolve())
		elseif s:sub(5,8) == "add" then
			print("File name:")
			name = read()
			files = fs.find(shell.resolve(name))
			for _,v in ipairs(files) do
				content = fs.open(shell.resolve(v),"r").readAll()
				fs.open(shell.resolve(".git/tracked/"..v),"w").write(content)
				print("Added file "..v)
			end
		end
	end
end