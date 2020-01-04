post_install() {
    local profile_path=$(_detect_profile_path)

    [[ -z "${profile_path}" ]] && { warn "No Firefox profile path found."; return; }

    link_to "$PEARL_PKGDIR"/user.js "${profile_path}"/user.js

    info "List of Firefox add-ons you may be interested to install:"
    echo "    - AdBlocker for YouTube: https://addons.mozilla.org/it/firefox/addon/adblock-for-youtube/"
    echo "    - Tampermonkey: https://addons.mozilla.org/it/firefox/addon/tampermonkey/"
    echo "    - Tree Style Tab: https://addons.mozilla.org/it/firefox/addon/tree-style-tab/"
    echo "    - Vim Vixen: https://addons.mozilla.org/it/firefox/addon/vim-vixen/"
    echo "    - Easy Youtube Video Downloader Express: https://addons.mozilla.org/it/firefox/addon/easy-youtube-video-download/"
    echo "    - In My Pocket: https://addons.mozilla.org/en-US/firefox/addon/in-my-pocket/"

    return 0
}

post_update() {
    post_install
    return 0
}

pre_remove() {
    local profile_path=$(_detect_profile_path)

    [[ -z "${profile_path}" ]] && return

    rm -rf "${profile_path}"/user.js
    return 0
}

_detect_profile_path() {
    if osx_detect
    then
        local profiles_path="$HOME/Library/Application Support/Firefox/Profiles"
    else
        local profiles_path="$HOME/.mozilla/firefox"
    fi

    local profile_list=()
    for profile in "$profiles_path"/*
    do
        profile_list+=("$profile")
    done

    # If there is only one profile just do not ask
    [[ "${#profile_list[@]}" == "1" ]] && { echo "${profile_list[0]}"; return; }
    [[ "${#profile_list[@]}" == "0" ]] && return

    local profile_path=$(choose "Which Firefox profile?" "${profile_list[0]}" "${profile_list[@]}")
    echo "$profile_path"
}
