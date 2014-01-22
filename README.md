# :1234: Polski

Polski is a reverse polish calculator written in Ruby.

## Features

### Highly Maintainable

Requirements change? No problem, Polski is highly extensible. Need a new interface? We have you covered. Don't like RPN? Swap out the Calculator. Everything in Polski is built for long running evolution.

Polski comes pre-built with a Ruby string and Console adapter, but you can easily create your own by placing a Polski configuration in your project's `initializers` directory.

```Ruby
# Create a Console adapter that uses Emoji prompts.
class MyEmojiAdapter
  # ...
end

Polski.configure do |config|
  config.adapter = MyEmojiAdapter
end
```

### Time Machine

![Delorean](http://www.moviecarmania.com/prodimages/BackToTheFuture_2710_L.jpg)

Make a mistake? Don't panic, just rewind and fast forward through time with `rw`, and `ff`. You'll feel like a master of the universe.

```Shell
> 2 30 +
32 # Whoops
> rw
30
> rw
2
> 0.3 +
2.3
> q
Bye!
```

## Usage

Install the Polski gem and run `pc` - *Polski Calculator*.

Or in Ruby:

```Ruby
calc = Polski.start_session
calc << "2 3 +"
# => 5
calc << "2"
# => 2
calc << "*"
# => 10
