$vi git_hub
#
#initialize git to push or pull from github
#
git init
echo "please enter url:"
read url
echo "you have entered $url"
echo "press y to continue or n to exit"
read cond
 
 if [ "$cond" == "n" ]; then
  exit 0
 fi 

echo "if origin already exist press y or else n"
read org

 if [ "$org" == "n" ]; then
  git remote add origin "$url"
 else
  git remote set-url origin git://"$url"
 fi
