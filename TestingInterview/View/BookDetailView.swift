//
//  BookDetailView.swift
//  TestingInterview
//
//  Created by Marsha Likorawung on 09/12/24.
//
import SwiftUI

struct JobDetailView: View{
    let job: Job
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var jobViewModel: JobViewModel
    @State private var isNavHome = false

    var body: some View {
        LazyVStack {
            VStack{
                AsyncImage(url: URL(string: job.corporateLogo)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity, maxHeight:
                                100)
                } placeholder: {
                    VStack {
                        ProgressView()
                    }.frame(minWidth: 0, maxWidth: .infinity)
                }
            }
            VStack (alignment: .leading){
                Text(job.positionName).bold().font(.headline)
                Text("\(job.corporateName) (\(job.postedDate ?? ""))").font(.footnote).foregroundColor(.gray)
                Text(job.descriptions).lineLimit(3).font(.caption)
            }.padding()
            VStack(alignment: .center){
                Button(action: {
                  
                }) {
                    Text("Lamar").padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        ).padding(.horizontal)
                }
                .buttonStyle(DefaultButtonStyle())
            }
        }
    }
}

#Preview {
    JobDetailView(job: Job.jobData.first!).environmentObject(JobViewModel())
}
