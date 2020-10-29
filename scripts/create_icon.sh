if [[ ! -f "$1" ]]; then
    echo "No icon file found"
    exit 1
fi

ICON_PATH=$1

function createicons() {
    mkdir pngpic.iconset

    sips -z 16 16 $ICON_PATH --out pngpic.iconset/icon_16x16.png
    sips -z 24 24 $ICON_PATH --out pngpic.iconset/icon_24x24.png
    sips -z 32 32 $ICON_PATH --out pngpic.iconset/icon_32x32.png
    sips -z 48 48 $ICON_PATH --out pngpic.iconset/icon_48x48.png
    sips -z 64 64 $ICON_PATH --out pngpic.iconset/icon_64x64.png
    sips -z 96 96 $ICON_PATH --out pngpic.iconset/icon_96x96.png
    sips -z 128 128 $ICON_PATH --out pngpic.iconset/icon_128x128.png
    sips -z 256 256 $ICON_PATH --out pngpic.iconset/icon_256x256.png
    sips -z 512 512 $ICON_PATH --out pngpic.iconset/icon_512x512.png
    sips -z 16 16 $ICON_PATH --out pngpic.iconset/icon_1024x1024.png

    # 生成icns
    iconutil -c icns pngpic.iconset -o icon.icns

    # 生成ico 文件
    icotool -c pngpic.iconset/icon_128x128.png -o icon.ico

    rm -rf icons
    mkdir icons

    mv -f pngpic.iconset/icon_16x16.png icons/16x16.png
    mv -f pngpic.iconset/icon_24x24.png icons/24x24.png
    mv -f pngpic.iconset/icon_32x32.png icons/32x32.png
    mv -f pngpic.iconset/icon_48x48.png icons/48x48.png
    mv -f pngpic.iconset/icon_64x64.png icons/64x64.png
    mv -f pngpic.iconset/icon_96x96.png icons/96x96.png
    mv -f pngpic.iconset/icon_128x128.png icons/128x128.png
    mv -f pngpic.iconset/icon_256x256.png icons/256x256.png
    mv -f pngpic.iconset/icon_512x512.png icons/512x512.png
    mv -f pngpic.iconset/icon_1024x1024.png icons/1024x1024.png

    rm -rf pngpic.iconset
}

createicons