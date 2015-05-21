echo "Setting up TWRP..."
rm -rf ../bootable/recovery  
git clone https://github.com/omnirom/android_bootable_recovery.git -b android-5.1 ../bootable/recovery  
git clone https://github.com/Tasssadar/libbootimg.git ../system/extras/libbootimg
sed -i '10permissive recovery;' ../external/sepolicy/recovery.te
echo "TWRP Setup Complete"
