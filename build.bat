if [ -e "codebase.pde" ]
then
	rm codebase.pde
fi
cat *.pde > codebase.pde
cp codebase.pde mario/
cp codebase.pde docs/