# ByteCoin 💰

An iOS app that displays the live Bitcoin price in your chosen currency.

## About

Built as part of [Angela Yu's iOS Development Bootcamp](https://www.udemy.com/course/ios-13-app-development-bootcamp/) on Udemy. The base project and UI were provided by The App Brewery, with networking and delegate logic implemented by me.

## Features

- Live Bitcoin prices powered by [CoinAPI](https://www.coinapi.io/)
- Supports 21 currencies including USD, EUR, GBP, JPY and more
- Clean, minimal UI with a currency picker

## What I Learned

- Networking with URLSession
- Parsing JSON with Codable
- Delegate design pattern
- Asynchronous programming with DispatchQueue

## Setup

1. Clone the repo
2. Get a free API key from [coinapi.io](https://www.coinapi.io/)
3. In `CoinManager.swift`, replace `YOUR_API_KEY_HERE` with your key
4. Build and run in Xcode

## Requirements

- iOS 13+
- Xcode 11+
- Swift 5
