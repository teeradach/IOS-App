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
        // start - Create URL request by inputing the url string since URL(string:) method return optional URL then we use guard let to detect the null that might return. So if URL(String:) return null then fall to else block which is  return getUsers() with fatalError("Missing URL"). Otherwise, continue to the next line in getUsers()
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { fatalError("Missing URL") }

        // create URLRequest by url from previous step since URLRequest(url:) return non-optional URLRequest so we no need to perform if let or gaurd let we rather just assign the URLRequest(url: url) resule directly to immutable varaible or let variable
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
