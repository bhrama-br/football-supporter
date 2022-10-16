# Football Supporter - API

Follow the news from your favorite player.


- [@admin_app](https://github.com/bhrama-br/football-supporter-admin)

- [@user_app](https://github.com/bhrama-br/football-supporter-user)



## Versions

```bash
  Ruby -v
  3.1.2p20
```
    
```bash
  node -v
  v16.17.1
```
## Run Locally

Clone the project

```bash
  git clone https://github.com/bhrama-br/football-supporter.git
```

Go to the project directory

```bash
  cd football-supporter
```

MASTER KEY
```bash
  260d64a47f43eeb37f52760a88ab2cdc
```

Install dependencies

```bash
  bundle install
```

Create DB

```bash
  rails db:create db:migrate db:seed
```

Start the server

```bash
  rails s -p 4000
```

Start the server Redis

```bash
  redis-server
```

Start the server sidekiq

```bash
  sidekiq
```


## Gem Used

- devise_token_auth
- active_model_serializers
- kaminari
- sidekiq


## Future improvements

- Improve test coverage
- Create documentation framework for endpoints
- Create server staging


## Author

- [@bramante](https://github.com/bhrama-br)


## 🔗 Links
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/paulobramante/)
