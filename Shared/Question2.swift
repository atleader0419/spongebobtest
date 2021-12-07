//
//  Question2.swift
//  spongebobtest
//
//  Created by Chang Jack on 2021/12/6.
//

import Foundation
import SwiftUI

struct Question2View: View {
    
    @State private var ChooseIndex = 0
    
    @State private var ThreeEat =  0.0
    
    @State private var showans = false
    
    let name = ["","派大星", "章魚哥", "珊迪", "蟹老闆", "皮老闆", "彼得潘"]
    
    let images = ["","派大星", "章魚哥", "珊迪", "蟹老闆", "皮老闆", "彼得潘"]
    
    func score1(index1:Int)->Int{
        if index1 == 0{
            return 0
        }
        else if index1 == 1{
            return 20
        }
        else if index1 == 2{
            return 0
        }
        else if index1 == 3{
            return 0
        }
        else if index1 == 4{
            return 0
        }
        else if index1 == 5{
            return 0
        }
        else {
            return 0
        }
    }
    
    func score2(index2:Int)->Int{
        if index2 == 0{
            return 0
        }
        else if index2 == 1{
            return 20
        }
        else if index2 == 2{
            return 0
        }
        else if index2 == 3{
            return 0
        }
        else if index2 == 4{
            return 0
        }
        else {
            return 0
        }
    }
    
    func addscore()->Int{
        var score=0
        score+=score1(index1:ChooseIndex)
        score+=score2(index2:Int(ThreeEat))
        return score
    }
    
    func getresult(sum:Int)->String{
        if sum == 0 {
            return "很可惜！都不對喔 得了0分 再加油～"
        }
        else if sum == 20{
            return "你答對其中1題！得了20分 不錯馬"
        }
        else if sum == 40{
            return "你2題都對了！得了40分很棒喔"
        }
        return "很可惜！都不對喔 得了0分 再加油～"
    }
    
    var body: some View {
        VStack{
            
            DisclosureGroup("海綿最好的朋友是？") {
                VStack {
                    Picker("選一個吧！",selection: $ChooseIndex) {
                        ForEach(0 ..< name.count) { (i) in
                            Text(name[i])
                        }
                    }.pickerStyle(WheelPickerStyle())
                    
                }
            }
            .padding()
            Image(images[ChooseIndex])
                .resizable()
                .frame(width: 150, height: 150)
            DisclosureGroup("是誰會在凌晨3點吃美味蟹堡呢？") {
                VStack {
                    Slider(value: $ThreeEat, in: 0...6, step:1){Text("選一個")}
                                .font(.title2)
                                .accentColor(.blue)
                      }
            }
            .padding()
            Image(images[Int(ThreeEat)])
                .resizable()
                .frame(width: 150, height: 150)
            Button {
                showans = true
                } label: {
                    Text("看看你在這階段得了幾分").font(.title2)
                    
                }.alert(isPresented: $showans) { () -> Alert in
                    return Alert(title: Text(getresult(sum: addscore())))
                }
        }
        
        
    }
    
}
struct Question2View_Previews: PreviewProvider {
    static var previews: some View {
        Question2View()
    }
}
