#!/bin/bash
 
###########################################################
#
#
# Boost 1.57 C++ libraries setup
#
#
###########################################################
 
# Starting setup of Boost 1.57
echo "Setting up Boost 1.57..."
 
 
#----------------------------------------------------------
# Installing dependent packages
#----------------------------------------------------------
 
# Inform the user about the next action
echo "Installing the dependent packages build-essentials g++ gcc libicu-dev..."
 
# Execute the action
sudo apt-get -y install build-essentials g++ gcc libicu-dev
 
 
#----------------------------------------------------------
# Installing Boost
#----------------------------------------------------------
 
# Inform the user about the next action
echo "Downloading and installing Boost 1.57..."
 
# Constant values definitions
FOLDER_NAME="Boost1.57"
 
# Create a new folder for storing the source code
mkdir ${FOLDER_NAME}
 
# Change directory
cd ${FOLDER_NAME}
 
# Download source code
wget http://sourceforge.net/projects/boost/files/boost/1.57.0/boost_1_57_0.zip
 
# Extract archive
unzip boost_1_57_0.zip
 
# Change directory
cd boost_1_57_0
 
# Run the script which prepares Boost's build process
sudo ./bootstrap.sh --prefix=/usr/local --with-libraries=all
 
# Compile the project
sudo ./b2 install
 
# Add the Boost libraries path to the default Ubuntu library search path
sudo /bin/bash -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/boost.conf'
 
# Update the default Ubuntu library search paths
sudo ldconfig
 
# Return to the parent directory
cd ../../
 
# Remove all source files
sudo rm -rf ${FOLDER_NAME}
 
# Inform user that Boost 1.57 was successfully installed
echo "Boost 1.57 was successfully installed."
