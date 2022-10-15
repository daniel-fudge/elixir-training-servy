# Elixir/OTP Training Project
This is a simple Elixir/OTP project developed while taking the [Developing With Elixir/OTP](https://pragmaticstudio.com/elixir) video course.

I highly recommend taking the [course](https://pragmaticstudio.com/elixir) if you are interested in learning Elixir/OTP. There is also a free trial period to get started.

## General Notes
#### OTP = Open Telecom Platform
20+ year old name that has stuck, even though OTP applies well beyond telecom. Now bases of the [OTP Design Principles](https://www.erlang.org/doc/design_principles/des_princ.html) 
implemented in Erlang.

## Useful Commands

### External Commands
#### Create mix project:
`mix new servy`  
#### Compile and Run:  
`elixir lib/servy/handler.ex`  
#### Start iex in project context:  
`iex -S mix`
#### Run all the unit tests:    
`mix test`
#### Run a specific unit test module:    
`mix test test/handler_test.exs`
#### See dependencies
`mix deps`
#### Get dependencies
`mix deps.get`
#### Compile dependencies
`mix deps.compile`

### iex commands
#### Recompile and reload: 
`r Servy.Handler`
#### Recompile full project: 
`recompile()`

## References
Erlang Docs - https://www.erlang.org/docs    
OTP Design Principles - https://www.erlang.org/doc/design_principles/des_princ.html    
