FROM ruby:3.1.2-buster

RUN mkdir -p /planner
WORKDIR /planner

# Add zsh in docker to have nice syntax highlighting, completions and autosuggestions
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" -- \
  -t https://github.com/denysdovhan/spaceship-prompt \
  -a 'SPACESHIP_PROMPT_ADD_NEWLINE="false"' \
  -a 'SPACESHIP_PROMPT_SEPARATE_LINE="false"' \
  -p git \
  -p https://github.com/zsh-users/zsh-autosuggestions \
  -p https://github.com/zsh-users/zsh-completions \
  -p https://github.com/zsh-users/zsh-syntax-highlighting

COPY Gemfile Gemfile.lock ./

RUN gem install bundler -v 2.3.7 && bundle install -j4
