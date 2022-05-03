//
//  Parser.swift
//  AvitoTestTask
//
//  Created by bowtie on 02.05.2022.
//

import Foundation

final class Parser {
    static let shared = Parser()
    
    func getAvito(completion: @escaping (Avito) -> ()) {
        guard let url = URL(string: "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let avito = try JSONDecoder().decode(Avito.self, from: data)
                DispatchQueue.main.async {
                    completion(avito)
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
