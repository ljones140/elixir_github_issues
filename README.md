# Issues

This application was written following chapter 13 of Dave Thomas's Programming
Elixir 1.2 book.

This is a CLI application that fetches issues from github repositories and
returns the number, created_at date and title of the issue in a table.

## Installation

Clone the repsitory:
```sh
$ git clone git@github.com:ljones140/elixir_github_issues.git
```
Install dependancies:
```sh
$ mix deps.get
```
Compile:
```sh
$ mix escript.build
```
This creates an executable `issues` file which can be used by passing in the user,
repository and no of issues you want to retrieve.
```sh
$ ./issues <github-user> <repository> <no of issues>
```
For example if you wanted to retrieve the lastest 3 issues from elixir-langs
elixir repo use:
```sh
$ ./issues elixir-lang elixir 3
```
The no of issues argument is optional and will default to 4 if not supplied

## Testing

Exunit has been used to test.
To run tests:
```sh
$ mix test
```

## Generating documenation

To generate ExDoc documentation run
```sh
$ mix docs
```
Then open the file `docs\index.html` in a browser to read them.
