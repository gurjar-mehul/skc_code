# README

## Getting started

### Prerequisites

- Ruby `2.5.1`
- Rails `5.1.4`

### Setting up

```bash
git clone https://github.com/gurjar-mehul/skc_code.git
bundle install

cp config/secrets.yml.example config/secrets.yml
rails db:create
rails db:migrate
rails db:seed
```
