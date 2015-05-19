rm -r bootable/recovery  
git clone https://github.com/Tasssadar/Team-Win-Recovery-Project.git bootable/recovery  
git clone https://github.com/Tasssadar/multirom.git system/extras/multirom  
git clone https://github.com/Tasssadar/libbootimg.git system/extras/libbootimg
cd system/extras/multirom
git submodule update --init
