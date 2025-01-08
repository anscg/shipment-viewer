FROM ruby:3.3.4

WORKDIR /code
COPY . /code
RUN bundle install

# Install Nginx
RUN apt-get update && apt-get install -y nginx

# Copy Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

#debugfdksfhsdf
RUN nginx -t

# Start Nginx and the Ruby application
CMD service nginx start && bundle exec rackup --host 0.0.0.0 -p 4567

EXPOSE 80 4567