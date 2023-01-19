function __fish_pnpm_run
    if test -e package.json; and set -l python (__fish_anypython)
        # Warning: That weird indentation is necessary, because python.
        $python -S -c 'import json, sys; data = json.load(sys.stdin);
for k,v in data["scripts"].items(): print(k + "\t" + v[:18])' <package.json 2>/dev/null
    else if test -e package.json; and type -q jq
        jq -r '.scripts | to_entries | map("\(.key)\t\(.value | tostring | .[0:20])") | .[]' package.json
    end
end

# Scripts can be used like normal subcommands, or with `pnpm run SCRIPT`.
complete -c pnpm -n '__fish_use_subcommand; or __fish_seen_subcommand_from run' -xa "(__fish_pnpm_run)"
