# Pokedex - Flutter

This is a Flutter project that used [PokéAPI](https://pokeapi.co/) to display the listing and details of Pokémons.

## How to test it

- Be sure that you have Flutter environment ready and set
- Clone this project
- Open your favorite IDE
- Run `flutter pub get` in terminal
- Just tap run and start getting fun 😁

## Project structure

### Architecture
This project was built with Clean Architecture pattern with layers `data`, `domain` and `presentation`.

### UI
The UI was built with a list screen, to user be able to see Pokémons with its image and names and a detail screen where you can see more information about it.
As the project uses an API to retrive information asynchronously, it was used `MOBX` to handle with main screen states: `Loading`, `Error` and `Success`

### Data serialization
To be easier to map json results from API to our model Dart class, this project uses [JSON Serialization](https://docs.flutter.dev/data-and-backend/serialization/json). This avoid the need of manually map each json attribute and create our class automatically with `.fromJson()` method.
