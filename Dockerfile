# This file we are using for ruby rails local development

FROM ruby:3.0.0

RUN mkdir "app"
WORKDIR app
COPY * .

RUN bundle install

EXPOSE 3000
CMD ["rails", "server", "--port", "3000","-b", "0.0.0.0"]


