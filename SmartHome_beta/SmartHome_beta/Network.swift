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
        
        
        // start - create request promise version.1
        let dataTask1 = URLSession.shared.dataTask(with: urlRequest, completionHandler: getUsersHandler)
        // end - create promise version.1
        // Execute promise version.1
        dataTask1.resume()
        
        // start - create request promise version.2 which equivalence with version.1
        let dataTask2 = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
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
        // end - create request promise version.2 which equivalence with version.1
        // Execute promise version.2
        dataTask2.resume()
    }
    
    func example() {
        //start - example of concept of higher order function with inline lambda function
        print(exampleOfHigherOrderFunction(operand1: 4, operand2: 5) { a, b in
            return (Double)(a * b - a / 2)
        })
        //end - example of concept of higher order function with inline lambda function
        
        //start - example of concept of higher order function with method reference
        print(exampleOfHigherOrderFunction(operand1: 4, operand2: 5, operation: xx))
        //end - example of concept of higher order function with method reference
    }
    
    func xx(x: Int, y: Int) -> Double {
        return (Double)(x * y - x / 2)
    }
    
    func getUsersHandler(data: Data?, response: URLResponse?, error: Error?) -> Void {
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
    
    func exampleOfHigherOrderFunction(operand1: Int, operand2: Int, operation: @escaping (Int, Int) -> Double) -> Int {
        return (Int)(5 + (operation(operand1, operand2) * 5))
    }
    
    // TODO: Add steps by steps comments
    // TODO: Add comment for function that takes function?
    // TODO: Create examples for High Order Function (HOC) JS equivalent const sth = ()=> console.log('hello') ?

    func callHTTPPOST() { //exercise
        
    }
    
}
