//
//  ContentView.swift
//  Shared
//
//  Created by judongseok on 2021/01/29.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var capital_class: capital_Class
    @State var showFavoritesonly = false
    
    var filteredCapital: [capital] {
        capital_class.capitals.filter { _capital in
            // 체크가 false면 뒤 조건 검사 안하고 전부 통과, 체크가 true면 뒤 조건 검사
            (!showFavoritesonly || _capital.favorite)
        }
    }
    var body: some View {
        NavigationView{
            List{
                Toggle(isOn: self.$showFavoritesonly){
                    Text("Favorites Only")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                .padding(.init(top: 10, leading: 10, bottom: 5, trailing: 10))
                .listRowInsets(EdgeInsets())
                .background(Color.white)
                ForEach(filteredCapital, id: \.self){ capital in
                    NavigationLink(destination: CapitalInfo( capitalinfo: capital)){
                        VStack {
                            HStack{
                                Image(capital.imageUrl)
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .padding(.leading, 20)
                                VStack(alignment: .leading){
                                    HStack {
                                        Text(capital.name)
                                            .font(.system(size: 18))
                                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                            .padding(.bottom, 2.0)
                                        if capital.favorite{
                                            Image(systemName: "star.fill")
                                                .resizable()
                                                .foregroundColor(.yellow)
                                                .frame(width: 20, height: 20)
                                        }
                                    }
                                    Text(capital.subtext)
                                        .font(.subheadline)
                                        .frame(width: 175, alignment: .leading)
                                }
                                .padding(.leading, 10)
                                Spacer()
                            }
                            .cornerRadius(10)
                        }
                    }
                }
                .frame(height: 150)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color(.systemGray4), radius: 15)
                .foregroundColor(.black)
                .padding(.init(top: 15, leading: 20, bottom: 15, trailing: 20))
                .listRowInsets(EdgeInsets())
                .background(Color.white)
            }
            
            .navigationBarTitle("Capitals", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(capital_Class())
    }
}
