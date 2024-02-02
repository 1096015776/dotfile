# var
dir=~/dotfile/
olddir=~/dotfile_bak/

#create folder
echo "Create $olddir for backup"
rm -rf $olddir
mkdir -p $olddir
echo "...done"

# change to dotfile dir
echo "changing to $dir directory"
cd $dir
echo "...done"

# setting hidden file
setopt glob_dots

# move any existing dotfile in homedir to olddir,
# then create symbollink
for file in ./dots/*;do
	filename=$(echo $file|rev|cut -d '/' -f-1|rev)
	echo ~/$filename
	if [ -e ~/$filename ];then
		echo "moving exsiting $filename to olddir"
		mv ~/$filename $olddir
	fi
	echo "creating symlink to $filename  in home directory"
	ln -s $dir/dots/$filename ~/$filename
done


# create bin symbollink
if [ -e ~/bin ];then
  mv ~/bin $olddir
fi
ln -s $dir/bin ~/bin
