post_install() {
    local profile_path=$(_detect_profile_path)

    link_to "$PEARL_PKGDIR"/user.js "${profile_path}"/user.js
    return 0
}

post_update() {
    post_install
    return 0
}

pre_remove() {
    local profile_path=$(_detect_profile_path)

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

    local profile_path=$(choose "Which Firefox profile?" "${profile_list[0]}" "${profile_list[@]}")
    echo "$profile_path"
}
