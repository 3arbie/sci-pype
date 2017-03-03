#!/bin/bash

pip=pip2

echo "Installing newest pip"
${pip} install --upgrade pip
echo ""

echo "Listing current pips"
${pip} list --format=columns
echo ""

echo "Installing pyxattr manually due to the -O2/-03 issue that is still in the 0.5.5 conda build: https://github.com/iustin/pyxattr/issues/13"
pushd $ENV_SCP_VENV_PATH >> /dev/null
git clone https://github.com/iustin/pyxattr.git pyxattr
${pip} install ./pyxattr
popd

echo "Installing Primary set of pips"
${pip} install --upgrade -r ./python2/primary-requirements.txt
last_status="$?"
if [[ "${last_status}" != "0" ]]; then
    echo "Failed to install Primary Python 2 requirements"
    exit 1 
fi

echo "Installing Secondary set of pips"
${pip} install --upgrade -r ./python2/secondary-requirements.txt
last_status="$?"
if [[ "${last_status}" != "0" ]]; then
    echo "Failed to install Secondary Python 2 requirements"
    exit 1 
fi

echo "Installing custom pips that are in development"
${pip} install --upgrade git+https://github.com/pydata/pandas-datareader.git

${pip} install --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.0.0-cp27-none-linux_x86_64.whl
last_status="$?"
if [[ "${last_status}" != "0" ]]; then
    echo "Failed to install Secondary Python 2 requirement: tensorflow"
    exit 1
fi

echo "Listing updated version of installed pips:"
${pip} list --format=columns
echo ""

exit 0
