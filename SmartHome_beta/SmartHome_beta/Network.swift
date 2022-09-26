//
//  Network.swift
//  SmartHome_beta
//
//  Created by Siroratt Suntronsuk on 8/9/2565 BE.
//


//option - URLSession.shared.dataTask, async/await, combine
import Foundation
class Network: ObservableObject {
    @Published var users: [User] = []
    func getUsers() { 
        // sample of HTTP get network caller
        // start - Create URL request
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)
        // end - Create URL request
        // start - create request promise
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedUsers = try JSONDecoder().decode([User].self, from: data)
                        self.users = decodedUsers
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        // end - create promise

        // Execute promise
        dataTask.resume()
    }
    
    // TODO: Add steps by steps comments
    // TODO: Add comment for function that takes function?
    // TODO: Create examples for High Order Function (HOC) JS equivalent const sth = ()=> console.log('hello') ?

    func callHTTPPOST() { //exercise
        
    }
    
}
