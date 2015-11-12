FINGERPRINTS_PATH=$1

if [ ! -f "FINGERPRINTS_PATH" ]; then
    echo "Please specify the path to the key fingerprints you wish to trust"
    exit 1
fi

sed -i"" -e "/START ssh-management-auto-trust/,/END ssh-management-auto-trust/ { d; }" ~/.ssh/known_hosts
cat $FINGERPRINTS_PATH >> ~/.ssh/known_hosts
