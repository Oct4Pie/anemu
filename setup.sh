#!/bin/sh


urls=(
    "https://dl.google.com/android/repository/platform-34-ext7_r03.zip"
    "https://dl.google.com/android/repository/platform-tools_r35.0.1-darwin.zip"
    "https://dl.google.com/android/repository/emulator-darwin_aarch64-11772612.zip"
    "https://dl.google.com/android/repository/sys-img/google_apis_playstore/arm64-v8a-34_r13.zip"
)

base_directory="android_files"


mkdir -p "$base_directory"

download_and_extract() {
    local url=$1
    local file_name=$(basename "$url")
    local output_dir=$2
    
    mkdir -p "$output_dir"
    cd "$output_dir"
    curl -O "$url"
    unzip "$file_name"
    
    rm "$file_name"
    cd -
}


extract_local_avd() {
    local file_name="avd.zip"
    local output_dir="$base_directory"
    
    # Check if the file exists
    if [ -f "$file_name" ]; then
        cd "$output_dir"
        
        unzip "../$file_name"
        
        cd -
    else
        echo "Error: $file_name does not exist."
    fi
}


create_start_script() {
    cat > "$base_directory/start.sh" <<EOF
#!/bin/sh
export ANDROID_AVD_HOME="\$PWD/avd"
export ANDROID_SDK_ROOT=\$PWD
./emulator/emulator -gpu host -avd Pixel_Tablet_API_34 -no-audio -no-window -no-snapshot-load -no-snapshot-save
EOF
    chmod +x "$base_directory/start.sh"
}

for url in "${urls[@]}"; do
    case "$url" in
        *platform-34-ext7*)
            download_and_extract "$url" "$base_directory/platforms"
        ;;
        *)
            download_and_extract "$url" "$base_directory"
        ;;
    esac
done

extract_local_avd

create_start_script
