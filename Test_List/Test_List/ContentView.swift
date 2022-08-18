//
//  ContentView.swift
//  Test_List
//
//  Created by vulcan on 14/8/2565 BE.
//

import SwiftUI

struct ContentView: View {
    let number = ["one", "two", "three", "four"]
    var body: some View {
        NavigationView {
            VStack {
            List(number, id: \.self) {numbers in                NavigationLink(destination: detailView(showNumber: numbers)) {
    Text(numbers)
            .padding()
                }
            }
            }
            .navigationBarTitle("Number List")
            }
    }
}

struct detailView: View {
    let showNumber: String
    var listNumberEmp = [String]()

    var body: some View {
        
    listNumberEmp.append(showNumber)
        Text(showNumber)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
