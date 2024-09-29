# Sandbox Playground

This repository serves as a sandbox playground for exploring and experimenting with various features and implementations in a monolithic Ruby on Rails (RoR) application. 
Based on Rails 7.2.1, it includes a pre-configured setup with essential gems and tools to streamline development. 
Different branches will be added to showcase specific implementations, allowing for isolated development and testing of new features.

## Table of Contents

- [Installation](#installation)
- [Customize](#customize)
- [Implementations](#implementations)
- [Gems](#gems)
- [Rake Tasks](#rake-tasks)
- [Contact](#contact)

## Installation

1. **Clone:**

```bash
git clone https://github.com/Grigore-George-Mihai/sandbox_playground
```

## Customize

- Run the following rake task to create your environment files:
    ```bash
    rake env:setup
    ````
    - After running the task, open the newly created .env.development and .env.test files to modify them with the appropriate environment-specific variables as needed.
- Create DB and seed:
    ```bash
    rails db:create db:migrate db:seed
    ````

## Implementations

- [S3 integration for file uploads with CarrierWave](https://github.com/Grigore-George-Mihai/sandbox_playground/pull/1)

## Gems

### Authentication
- [Devise](https://github.com/heartcombo/devise): Flexible authentication solution for Rails based on Warden.

### Background Processing
- [Sidekiq](https://github.com/mperham/sidekiq): Efficient background processing for Ruby applications.
- [Redis](https://github.com/redis/redis-rb): In-memory data structure store used by Sidekiq for managing background job queues, scheduling, and retries.

### Decorator and Forms
- [Draper](https://github.com/drapergem/draper): Helps in decorating models with additional presentation logic.
- [Simple Form](https://github.com/heartcombo/simple_form): Simplifies form creation with a clean and flexible syntax.

### Performance Monitoring
- [Scout APM](https://github.com/scoutapp/scout_apm_ruby): Application monitoring tool.
- [Bullet](https://github.com/flyerhzm/bullet): Detects N+1 queries and unused eager loading.
- [Rack Mini Profiler](https://github.com/MiniProfiler/rack-mini-profiler): Performance profiling tool.

### Debugging
- [Byebug](https://github.com/deivid-rodriguez/byebug): Debugging tool for Ruby applications.

### Code Quality & Linting
- [Rubocop Rails Suite](https://github.com/Grigore-George-Mihai/rubocop-rails-suite): A custom suite that bundles Rubocop with various plugins for Rails projects.

### Testing
- [Factory Bot Rails](https://github.com/thoughtbot/factory_bot_rails): Provides fixtures replacement with a straightforward definition syntax.
- [Faker](https://github.com/faker-ruby/faker): A library for generating fake data.
- [RSpec Rails](https://github.com/rspec/rspec-rails): Testing framework for Rails.
- [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers): Simplifies testing Rails applications with RSpec.
- [SimpleCov](https://github.com/simplecov-ruby/simplecov): Code coverage analysis tool.
- [Rspec-Sidekiq](https://github.com/philostler/rspec-sidekiq): Testing framework for Sidekiq jobs.

### Security
- [Brakeman](https://github.com/presidentbeef/brakeman): Static analysis tool for finding security vulnerabilities in Rails applications.
- [Bundler Audit](https://github.com/rubysec/bundler-audit): Scans your Gemfile for known vulnerabilities.

### Environment Management
- [Dotenv Rails](https://github.com/bkeepers/dotenv): Loads environment variables from `.env`.

## Rake Tasks

### Security Check
- Run the following rake task to check for security risks in your application:

    ```bash
    rake security:check
    ```

    - This task runs tools like Brakeman and Bundler Audit to ensure your application is secure.

## Contact

For questions or further information, feel free to reach out via [LinkedIn](https://www.linkedin.com/in/grigore-george-mihai-73981b86/).