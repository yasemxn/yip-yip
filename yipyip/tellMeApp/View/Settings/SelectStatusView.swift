//
//  SelectStatusView.swift
//  tellMeApp
//
//  Created by Yasemin Karaca on 15.05.2022.
//

import SwiftUI

struct SelectStatusView: View {
    @ObservedObject var viewModel = StatusViewModel()
    @State var status: UserStatus = .noStatus
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
           
            ScrollView{
                VStack(alignment: .leading) {
                    Text("CURRENT STATUS")
                        .foregroundColor(.gray)
                        .padding()
                    StatusCell(status: status)
                    
                    Text("SELECT YOUR STATUS")
                        .foregroundColor(.gray)
                        .padding()
                    
                    ForEach(UserStatus.allCases.filter({ $0 != .noStatus}), id: \.self) { status in
                        Button(action: {
//                            viewModel.updateStatus(status)
                            self.status = status
                        }, label: {
                            StatusCell(status: status)
                        })
                    }
                }
            }
        }
    }
}

struct SelectStatusView_Previews: PreviewProvider {
    static var previews: some View {
        SelectStatusView()
    }
}

struct StatusCell: View {
    let status : UserStatus
    var body: some View {
        HStack {
            Text(status.title)
                .foregroundColor(.black)
            Spacer()
            
        }
        .frame(height:56)
        .padding(.horizontal)
        .background(Color.white)
    }
}
