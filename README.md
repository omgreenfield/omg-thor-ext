# Thor extension

[Matt Brictson](https://github.com/mattbrictson) had the same complaints I did about [Thor](https://github.com/rails/thor). Well, he went and fixed them all, I put them into a gem and now use it in many of my Thor CLIs.

## Original source

https://github.com/mattbrictson/gem/blob/main/lib/example/thor_ext.rb

## What it does

Overwrites a few Thor methods so that it behaves more like a typical CLI:

- Accepts `-h` or `--help` to show help
- Treats unrecognized options as errors instead of ignoring them
- Prints error to `stderr` in red with no stacktrace
- Prints full stacktrace when setting `VERBOSE` environment variable
- Exists with a non-zero status on error

## Installation

```sh
gem i thor-ext
```

```ruby
gem 'thor-ext'
```

## Usage

In your Thor CLI:

```ruby
class SuperAwesomeCli < Thor
  extend ThorExt::Start
end
```
