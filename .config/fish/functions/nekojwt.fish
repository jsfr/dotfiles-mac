function nekojwt -d "Get a JWT token for https://dev.cur8.co/api"
    az account get-access-token --resource='https://dev.cur8.co/api' --query accessToken --output tsv
end
