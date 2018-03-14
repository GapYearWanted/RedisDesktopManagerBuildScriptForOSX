brew update > /dev/null 
brew install qt5 > /dev/null 
export PATH=/usr/local/opt/qt5/bin:$PATH
git clone --recursive https://github.com/uglide/RedisDesktopManager.git -b 0.9 rdm 
cd ./rdm/src  
./configure
cd ./3rdparty/crashreporter/
sudo qmake CONFIG-=debug 
sudo make 
cp crashreporter ../../bin/osx/release ``
cd ../../src/resources
cp ./Info.plist.example Info.plist 
cd ..
qmake CONFIG-=debug 
make -s -j4
cd ../bin/osx/release 
macdeployqt rdm.app


