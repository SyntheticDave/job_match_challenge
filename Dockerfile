# Use the specific Ruby version as the parent image
FROM ruby:3.2.2

# Install nodejs and yarn (used for webpacker and asset compilation)
RUN apt-get update -qq && apt-get install -y nodejs sqlite3
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

# Set the working directory in the container to /app
WORKDIR /app

# Add Gemfile and Gemfile.lock to the /app directory in the docker container
COPY Gemfile Gemfile.lock ./

# Install any needed packages specified in Gemfile
ARG BUNDLE_GEMFILE=Gemfile
ENV BUNDLE_GEMFILE=${BUNDLE_GEMFILE}

RUN bundle config --global github.https true && \
    bundle config force_ruby_platform true && \
    bundle install -j $(nproc) --retry 5 && \
    rm -rf /usr/local/bundle/cache/*.gem \
    && find /usr/local/bundle/gems/ -name "*.c" -delete \
    && find /usr/local/bundle/gems/ -name "*.o" -delete


# Copy the current directory contents into the container at /app
COPY . .

# Add a script to be executed every time the container starts.
COPY web.sh /usr/bin/
RUN chmod +x /usr/bin/web.sh
ENTRYPOINT ["web.sh"]

# Expose port 3000 for the API
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
