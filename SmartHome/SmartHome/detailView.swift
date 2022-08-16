//  detailView.swift
//  SmartHome
//
//  Created by vulcan on 9/8/2565 BE.
//

import SwiftUI

let deviceShow = ["Bluetooth1", "Bluetooth MII", "Aroyjung B"]
//var value:String

struct detailView: View {
    var body: some View {
        NavigationView {
        Text("Device List")
            .font(.largeTitle)
            .navigationTitle("Device List Home")
    //NavigationView{
        List {
            ForEach( 0 ..< deviceShow.count, id: \.self) { value in
                NavigationLink(destination: ContentView(data: value)){
                Button {
                }label:{
                    Text(deviceShow[value])
                }
                }
                }
                }
                }
    }
}
    

struct detailView_Previews: PreviewProvider {
    static var previews: some View {
        detailView()
    }
}
