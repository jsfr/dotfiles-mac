function pleo-dynamodb --description 'List all items in a Pleo db table'
        set -l environment $argv[1]
        set -l table $argv[2]
        aws-vault exec $environment -- aws dynamodb scan --table-name "$table-Configuration" | jq .Items | bat -l json
end

