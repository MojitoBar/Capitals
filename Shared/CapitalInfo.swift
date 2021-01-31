//
//  CapitalInfo.swift
//  Capitals
//
//  Created by judongseok on 2021/01/29.
//

import SwiftUI
import MapKit

struct FavoriteButton: View {
    @Binding var isSet: Bool
    var body: some View {
        Button( action: {
            isSet.toggle()
        }) {
            Image(systemName: isSet ? "star.fill" : "star")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(isSet ? Color.yellow : Color.gray)
        }
    }
}


struct CapitalInfo: View {
    @EnvironmentObject var capital_class : capital_Class
    var capitalinfo : capital
    @State private var region = MKCoordinateRegion()
    
    var capitalIndex: Int{
        capital_class.capitals.firstIndex(where: {$0.name == capitalinfo.name})!
    }
    
    var body: some View {
        VStack{
            Map(coordinateRegion: $region)
                .onAppear(){
                    setRegion(_capitalinfo: capitalinfo)
                }
                .ignoresSafeArea(edges: .top)
                .frame(height: 250)
            
            Image(capitalinfo.imageUrl)
                .resizable()
                .frame(width: 200, height: 200)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
                .offset(y: -100)
                .padding(.bottom, -110)
            HStack{
                VStack(alignment: .leading) {
                    HStack{
                        VStack(alignment: .leading) {
                            Text(capitalinfo.name)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            Text(capitalinfo.subtext)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        FavoriteButton(isSet: $capital_class.capitals[capitalIndex].favorite)
                    }
                    Divider()
                    ScrollView{
                        VStack(alignment: .leading){
                            Text("About " + capitalinfo.name )
                                .font(.title2)
                            Text(capitalinfo.content)
                        }
                    }
                }
                Spacer()
            }
            .padding()
            
            Spacer()
        }
    }

    private func setRegion(_capitalinfo: capital){
        region = MKCoordinateRegion(
            center: _capitalinfo.locationCoordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct CapitalInfo_Previews: PreviewProvider {
    static var previews: some View {
        CapitalInfo(capitalinfo: capital_Class().capitals[0])
            .environmentObject(capital_Class())
    }
}
