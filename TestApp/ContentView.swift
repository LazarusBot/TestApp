//
//  ContentView.swift
//  TestApp
//
//  Created by Max Prx on 13/04/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State private var isMultiColumn: Bool = false
    @State var ChangeLanguage: Bool = false
    
    private var columns: [GridItem] {
        if isMultiColumn {
            
            return [
                GridItem(.flexible()),
                GridItem(.flexible())
            ]
        } else {
            return [
                GridItem(.flexible())
            ]
        }
    }
    
    var body: some View {
        
        ZStack {
            
            ZStack {
                
                VStack {
                    
                    HStack {
                        Button {
                            
                        } label: {
                            Image(systemName: "line.3.horizontal.decrease")
                                .font(.title)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        Button {
                            withAnimation(.easeInOut(duration: 0.2)) { ChangeLanguage.toggle() }
                                
                        } label: {
                            Rectangle()
                                .foregroundColor(Color.gray.opacity(0.1))
                                .frame(width: 50, height: 50)
                                .cornerRadius(15)
                                .shadow(radius: 2)
                                .overlay{
                                    
                                    ZStack {
                                        Image(ChangeLanguage ? "france" : "england")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .cornerRadius(10)
                                    }
                                    
                                }
                        }
                        
                    }
                    .padding()
                    
                    Circle()
                        .foregroundColor(Color.purple)
                        .frame(width: 400, height: 400)
                        .blur(radius: 90)
                        .padding(.trailing, 240)
                        .padding(.top, -120)
                    
                    HStack{
                        Text("hello-string")
                            .foregroundColor(.white)
                            .font(.title3)
                        
                        Spacer()
                    }
                    .padding(.top, -280)
                    .padding(.leading, UIScreen.main.bounds.width - 370)
                    
                    Text("title")
                        .font(.system(size: 58))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.leading, ChangeLanguage ? UIScreen.main.bounds.width - 410 : UIScreen.main.bounds.width - 480)
                        .padding(.top, -260)
                    
                    Spacer(minLength: 40)
                    
                    HStack {
                        
                        Text("subtitle")
                            .font(.title2)
                            .foregroundColor(.white)
                            .fontWeight(.medium)
                        
                        Spacer(minLength: 0)
                        
                        Button {
                            isMultiColumn.toggle()
                        } label: {
                            Rectangle()
                                .foregroundColor(isMultiColumn ? Color.black.opacity(0.1) : Color.gray.opacity(0.1))
                                .frame(width: 40, height: 40)
                                .cornerRadius(10)
                                .shadow(radius: 2)
                                .overlay{
                                    
                                    ZStack {
                                        Image(systemName: "square.grid.2x2.fill")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(.white)
                                           
                                    }
                                    
                                }
                        }
                        
                        Button {
                            isMultiColumn.toggle()
                        } label: {
                            Rectangle()
                                .foregroundColor(isMultiColumn ? Color.gray.opacity(0.1) : Color.black.opacity(0.1))
                                .frame(width: 40, height: 40)
                                .cornerRadius(10)
                                .shadow(radius: 2)
                                .overlay{
                                    
                                    ZStack {
                                        Image(systemName: "line.3.horizontal")
                                            .resizable()
                                            .frame(width: 20, height: 10)
                                            .cornerRadius(0)
                                            .foregroundColor(.white)
                                    }
                                    
                                }
                        }
                    }
                    .padding()
                    .padding(.top, -140)
                    .padding(.leading, UIScreen.main.bounds.width - 385)
                    
                    Spacer(minLength: -22)
                    
                    ScrollView {
                        
                        LazyVGrid(columns: columns, alignment: .trailing, spacing: 5) {
                            
                            ForEach(0...3, id: \.self) {item in
                                RoundedRectangle(cornerRadius: 25, style: .continuous)
                                    .fill(.white.opacity(0.5))
                                    .frame(width: isMultiColumn ? 180 : 370, height: isMultiColumn ? 220 : 90)
                            }
                        }
                        .padding()
                    }
                    .padding(.top, -70)
                }
                
            }
        }
        .background(Color.gray.opacity(0.2))
        .environment(\.locale, Locale.init(identifier: ChangeLanguage ? "fr" : "en"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
