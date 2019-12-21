post_install() {
    local profile_path=$(_detect_profile_path)

    [[ -z "${profile_path}" ]] && { warn "No Firefox profile path found."; return; }

    link_to "$PEARL_PKGDIR"/user.js "${profile_path}"/user.js
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
