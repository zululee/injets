jets new api-demo --mode api

jets generate scaffold Post title:string
vim .env.development # adjust to your local database creds
jets db:create db:migrate
jets server