//
//  Question1.swift
//  spongebobtest
//
//  Created by Chang Jack on 2021/11/30.
//
import Foundation
import SwiftUI

struct Question1View: View {
    
    @State private var birthday = Date()
    
    @State private var showans = false
    
    @State private var score = 1
    
    @State private var pickindex = 0
    
    @State private var jokenumber: Int = 0
    

    
    var count=["1","20","23","25","30"]
    
    var BadAt=["抓水母","開船","空手道","做蟹堡"]
    
    func randomscore()->Int{
        let Rscore = [0,20]
        let score1 = Rscore.randomElement() ?? 0
        return score1
    }
    
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
        else {
            return 0
        }
    }
    
    func score2(index2:Int)->Int{
        if index2 == 0{
            return 0
        }
        else if index2 == 1{
            return 0
        }
        else if index2 == 2{
            return 0
        }
        else if index2 == 3{
            return 20
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
                score+=randomscore()
                score+=score1(index1:pickindex)
                score+=score2(index2:jokenumber)
        return score
    }
    
    func getresult(sum:Int)->String{
        if sum == 0 {
            return "很可惜！你3題都錯了！得了0分 再加油～"
        }
        else if sum == 20{
            return "你答對了1題了！得了20分 不錯馬"
        }
        else if sum == 40{
            return "你答對了2題了！得了40分很棒喔"
        }
        else {
            return "你3題都答對了！得了60分 咦？是太簡單嗎"
        }
    }
    
    var body: some View {
        VStack{
            Form{
                Section{
                    DatePicker("海綿的生日是？",selection: self.$birthday,displayedComponents: .date)
                        .padding()
                        .background(Color.white)
                }
                Section{
                    VStack{
                    Text("他最不會做什麼事？")
                    Picker(selection: $pickindex,label:Text(""))
                    {
                        ForEach(0 ..< BadAt.count) { i in
                            Text(self.BadAt[i]).tag(i)
                        }
                    }.pickerStyle(.segmented)
                    }
                }
                Section{
                    Stepper(value:self.$jokenumber,in:0...5){
                        Text("比24更好笑的笑話是？")
                            .padding(.trailing)
                        Text(count[jokenumber])
                            .padding(.leading)
                    }
                    
                }
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
            
        }

struct Question1View_Previews: PreviewProvider {
    static var previews: some View {
        Question1View()
    }
}
