#!/usr/bin/env bash

# if bashrc.d doesn't exist creat it
if [ ! -d ~/.bashrc.d ]; then
  mkdir -v -m 700 ~/.bashrc.d
fi


# update the bashrc file to source the .basrhc.d directory
# but try avoid duplicate entries
if ! grep -q 'for file in ~/.bashrc.d/\*.bash;do source' ~/.bashrc ;then
  echo ''
  echo '# process all local ~/.bashrc.d scripts if any' >>~/.bashrc
  echo 'for file in ~/.bashrc.d/*.bash;do source "$file"; done' >>~/.bashrc
fi

# copy the bashrc.d files in the ~/.bashrc.d directory
cp -v ./bashrc.d/*.bash ~/.bashrc.d/
# mark them as executable
chmod +x ~/.bashrc.d/*.bash

#for all my.xxx files copy into .bashrc.d directory if they differ
for f in other_rc/my.*; do
  f=basename "$f"
  out_f=~/.${f#*.}
  diff $f $out_f 2>/dev/null
  if [ $? -ne 0 ]; then
    echo "updating $out_f... "
    cat $f  >$out_f
  fi
done

