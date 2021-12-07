//
//  menu.swift
//  spongebobtest
//
//  Created by Chang Jack on 2021/11/29.
//

import Foundation
import SwiftUI


struct MenuView: View {
    @State var name = ""
    var body: some View {
        ZStack{
        Image("bikini bittom")
            .scaledToFit()
        NavigationView{
        VStack{
        NavigationLink{
            ChooseTestView(name: $name)
        }
        label: {
            Image("menu_spo")
                .resizable()
                .frame(width: 200, height: 200)
        }
            Text("海綿寶寶小測驗")
                .foregroundColor(Color.blue)
                .bold()
            TextField("輸入你的名字後點擊圖片",text: $name)
                .font(.system(size: 15))
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.blue, lineWidth: 2))
            Text("歡迎！\(name)")
        }
        .padding()
        
        }
            
        }
    }
}
struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
