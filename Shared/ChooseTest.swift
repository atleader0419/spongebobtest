//
//  ChooseTest.swift
//  spongebobtest
//
//  Created by Chang Jack on 2021/11/29.
//

import SwiftUI

struct ChooseTestView: View {
    @State private var bgcolor = Color.blue
    
    @State var showsheet = false
    
    @State var somewords = ""
    
    @Binding var name : String
    
    @State var imageindex = true
    
    var body: some View {
            Form{
                Group{
            
                    Section
                    {ColorPicker("選個字體顏色！",selection: $bgcolor,supportsOpacity: false)
                    .frame(width: 300)
                    .foregroundColor(bgcolor)

                        Toggle((imageindex ? "全家福1": "全家福2"), isOn: $imageindex)
                        
                    }
                        
                    Section{
                    NavigationLink{
                        Question1View()
                        }
                    label:{
                        Text("海綿寶寶基本資料")
                    }

                        NavigationLink{
                            Question2View()
                        }
                        label:{
                            Text("其他題")
                        }
                
                        TextField("輸入一些你想對海綿寶寶說的話吧！",text: $somewords)
                            .font(.system(size: 15))
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.blue, lineWidth: 2))
                    }
                    Section{
                    Button {
                        showsheet=true
                    } label: {
                        Text("查看結果").font(.title2)
                    }.sheet(isPresented: $showsheet) {
                        talktospongeView(word: $somewords,showsheet:$showsheet,bgcolor: $bgcolor)
                    }
                    }
                    
                }
                if (imageindex==false){
                        Image("全家福1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                }
                else {
                    Image("全家福2")
                        .resizable()
                        .scaledToFit()
                .frame(width: 300, height: 300)
                }
                    
                    
                    
                }
                .navigationTitle("你好！\(name)")
                .navigationBarTitleDisplayMode(.inline)
                .foregroundColor(bgcolor)
            }
    
    }
    
struct ChooseTestView_Previews: PreviewProvider {
    @State static var namee="123"
    static var previews: some View {
        NavigationView{
            ChooseTestView(name: $namee)
            
        }
    }
}
