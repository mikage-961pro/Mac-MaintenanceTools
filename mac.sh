echo "cleaning Xcode DerivedData"
sudo rm -rf ~/Library/Developer/Xcode/DerivedData/*
echo "clean Xcode DerivedData!"

echo "cleaning  Xcode Archives!"
sudo rm -rf ~/Library/Developer/Xcode/Archives/*
echo "clean Xcode Archives!"

echo "cleaning Library Caches"
sudo rm -rf ~/Library/Caches/*
echo "clean Library Caches!"

echo "cleaning iOS logs"
sudo rm -rf ~/Library/Logs/iOS\ Simulator
echo "clean iOS logs"

echo "全てのシミュレーターのキャッシュを削除します…"
echo "全てのシミュレーターのキャッシュを削除しています…"
sudo rm -rf ~/Library/Developer/Xcode/iOS\ DeviceSupport/*
echo "clean simulator cache"

echo "Macのメンテナンスを実施します"
echo "Macのメモリー開放中…"
sudo purge
du -sx /
echo "Macのメモリー開放完了"

echo "アプリとOSのキャッシュのアップデート中…"
sudo update_dyld_shared_cache -force 

echo "ドライバキャッシュのクリア中…"
sudo kextcache -system-caches

echo "カーネルキャッシュの更新中…"
sudo kextcache -system-prelinked-kernel

echo "Mac OS メンテナンスモードの実行中…"
sudo kextcache -system-prelinked-kernel

echo "Mac OS アップデートの確認中…"
sudo softwareupdate --list 
echo "Mac OS アップデートチェック完了。"

sudo softwareupdate --install --all
echo "Mac OS アップデート完了。"

echo "Mac OSセキュリティー設定のアップデート中"
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1
sudo softwareupdate -l --include-config-data

echo "Mac OSセキュリティー設定のアップデート完了"