temp=$(sensors | grep Package)
temp=${temp#*+}
temp=${temp%%(*}
echo $temp
