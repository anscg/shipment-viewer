FROM ruby:3.3.4

WORKDIR /code

RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 4567

CMD ["sh", "-c", "nginx && bundle exec rackup --host 0.0.0.0 -p 4567"]
