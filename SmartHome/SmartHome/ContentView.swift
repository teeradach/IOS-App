//
//  ContentView.swift
//  SmartHome
//
//  Created by vulcan on 2/8/2565 BE.
//

import SwiftUI


let devices = ["Device1", "Device2"]
struct ContentView: View {

    let device = ["Device1", "Device    2", "Device3", "Device4"]
    let data: String
    var body: some View {
                N               avi gationView{
        VStack(spacing: 10){
            Text("Smart Home")
            Divider()
            .padding()

        .font(.largeTitle)
        .navigationTitle("Smart Home")
            NavigationLink(destination: detailView()){
            //}
            
            Button("Add Device"){
                //NavigationLink(destination: //detailView()){
                }
            }
             
            ForEach(0 ..< devices.count, id: \.self) {
                value in
                HStack{
                Text(String(self.device[value]))
                    .padding()
                    Button("Disconnect"){
                        
                    }
                    Button("Remove Device"){

                        
                    }
                        //NavigationLink(destination: //detailView()){
                        //}
//Text(values)
                
                
                
                }
                }
            }
        }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
