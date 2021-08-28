# StarWars

StarWars is an app that displays various aspects of the Star Wars cinematic universe. It uses the StarWars Package to get all the aspects from the SWAPI endpoint. 

## Installation
- Opening the example project
```Clone the repo at https://github.com/angiemugo/StarWars.git and open StarWars.xcodeproj```
- Opening the SDK 
```Clone the repo at https://github.com/angiemugo/StarWars.git and open Package.swift```. 

Since StarWars uses SPM(Swift Package Manager), there's no set up required aside from opening it and running it. 

## Usage
The `StarWars` package has four methods that can be used in any sample app 
- RemoteDataSource.shared.starWarsPeople()
- RemoteDataSource.shared.starWarsPlanets()
- RemoteDataSource.shared.starWarsFilms()

## Libraries
RxCocoa/RxSwift - I used these because I wanted to use MVVM and reactive coding. I am in the process of learning combine and I believe it would have been a much better implementation for this when used together with SwiftUI. 

## Could have been better 
Given more time
- I would have written more tests. 
- I would have tested the example app itself. 
- I would also have built a better UI. 
- I would have implemented a better error handling system. 
- I would have set up a CI/CD pipeline

It was my first time building an SDK and I found it to be an interesting change of pace. I enjoyed focusing more on how my product would be easier and more intuitive to a developer. 
