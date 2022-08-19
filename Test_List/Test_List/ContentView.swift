//
//  ContentView.swift
//  Test_List
//
//  Created by vulcan on 14/8/2565 BE.
//

import SwiftUI
var listNumberEmp = [String]()
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
    //var listNumberEmp = [String]()
    mutating func addArray(values: String) {
        listNumberEmp.append(values) }
    //below this line is error call function it's error
    //addArray(value: "one")
    var body: some View {
        
        VStack {
            List(listNumberEmp, id: \.self) { value in
        
        Text(value)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
