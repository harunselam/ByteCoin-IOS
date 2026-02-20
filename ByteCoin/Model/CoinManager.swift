//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate: AnyObject {
    func didUpdatePrice(_ manager: CoinManager, price: Double, currency: String)
    func didFailWithError(_ error: Error)
        
    
}
class CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "YOUR_API_KEY_HERE"
    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)"
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url:url)
        
        request.addValue(apiKey, forHTTPHeaderField: "X-CoinAPI-Key")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
                    if let error = error {
                        self.delegate?.didFailWithError(error)
                        return
    }
            if let http = response as? HTTPURLResponse, http.statusCode != 200 {
                self.delegate?.didFailWithError(NSError(domain: "HTTP", code: http.statusCode))
                            return
                        }

                        guard let data = data else { return }

            if let price = self.parseJSON(data) {
                self.delegate?.didUpdatePrice(self, price: price, currency: currency)
                        } else {
                            self.delegate?.didFailWithError(NSError(domain: "Decode", code: -1))
                        }
                    }.resume()
                }
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func parseJSON(_ data: Data) -> Double? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let lastPrice = decodedData.rate
            
            return lastPrice
        } catch {
            delegate?.didFailWithError( error)
            return nil
        }
    }
}
