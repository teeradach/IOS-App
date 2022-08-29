//
//  ContentView.swift
//  SmartHome_beta
//
//  Created by vulcan on 29/8/2565 BE.
//

import SwiftUI

struct ContentView: View {
    
    @State var detailShow: Bool = false
    @Binding var deviceShow: [String]
    
    var body: some View {
        if !detailShow {
            VStack {
    Text("SmartHome")
            .padding()
                Button("Add Device", action :{
                    self.detailShow.toggle()
                })
                List(deviceShow, id: \.self) { device in
                    Text(device)
                }
            }
            }
        detailView(detailShow: $detailShow, deviceShow: $deviceShow)
        }
}

struct detailView: View {
    @State var deviceShow: [String] = []
    
    @Binding var detailShow: Bool
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
                //self.detailShow.toggle()
            }
        }
        //contentView(deviceShow: $deviceShow)
    }
}
