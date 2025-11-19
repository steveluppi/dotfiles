demo:
 @echo this is a demo task

open:
  open "https://www.google.com"

[no-cd]
here:
  @echo Shutdown any already running docker containers.
  @docker ps | grep -E 'redis|postgres|maildev' | cut -w -f 1 | xargs docker stop
  @echo Starting docker compose here.
  @docker-compose start
  # @rails assets:precompile

[no-cd]
link:
  @ln ~/github/rubicon/lib/tasks/_sjl_luppi.rake lib/tasks || true
  @ln ~/github/rubicon/config/credentials/qa.key config/credentials/qa.key || true
  @ln ~/github/rubicon/config/credentials/demo.key config/credentials/demo.key || true
  @ln ~/github/rubicon/config/credentials/production.key config/credentials/production.key || true

[no-cd]
puma:
  bundle exec puma -b tcp://127.0.0.1:3001

gpt:
  ollama serve

chat:
  ollama run qwen2.5-coder:7b

[no-cd]
new_env:
  bin/secrets
  bundle install
  npm i
  bin/shakapacker
  rails assets:precompile

[no-cd]
ui:
  git fetch --all --tags --prune
  git pull
  npm start
