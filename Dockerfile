FROM ruby:3.3.4

WORKDIR /code
COPY . /code
RUN bundle install

RUN apt-get update && apt-get install -y nginx

COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80 4567

CMD ["sh", "-c", "nginx && bundle exec rackup --host 0.0.0.0 -p 4567"]