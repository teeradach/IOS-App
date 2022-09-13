//
//  ContentView.swift
//  SmartHome_beta
//
//  Created by vulcan on 29/8/2565 BE.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var network: Network
    @State var detailShow: Bool = false
    @State var deviceShow: [String] = []
    
    
    var body: some View {
        if !detailShow {
            VStack {
    Text("SmartHome")
            .padding()
                Button("Add Device", action :{
                    self.detailShow.toggle()
                    network.getUsers()
                })
                
                List(network.users, id: \.self) { user in
                    Text(user.name)
                }
                
                List(deviceShow.enumerated().map({ $0 }), id: \.0.self) {idx, item in
                    Text("\(idx) - \(item)")
                    Button("Remove", action : {
                        deviceShow.remove(at: idx)
                    })
                }
            }
        }
        detailView(detailShow:$detailShow, deviceShow: $deviceShow)
        }
}

struct detailView: View {
    
    
    @Binding var detailShow: Bool
    @Binding var deviceShow: [String]
    let deviceList = ["Device1", "Device2", "Device 3"]
    var body: some View {
        if detailShow {
Text("SmartHome Page 2")
            ForEach(deviceList, id: \.self){ value in
                Button(value, action: {
                    
                    self.detailShow.toggle()
                    self.deviceShow.append(value)
                })
            }
            Button("Back") {
                self.detailShow.toggle()
            }
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Network())
    }
}
