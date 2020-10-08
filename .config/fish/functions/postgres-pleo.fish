function postgres-pleo
    docker run --name postgres-$argv -e POSTGRES_PASSWORD=pleo -e POSTGRES_DB=$argv -e POSTGRES_USER=pleo -p 5432:5432 -d postgres
end

