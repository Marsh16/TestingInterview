//
//  JobCard.swift
//  TestingInterview
//
//  Created by Marsha Likorawung on 09/12/24.
//

import SwiftUI

struct JobCard: View{
    let job: Job
    var body: some View {
        LazyVStack {
            HStack {
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
                    Text("\(job.corporateName) (\(job.status))").font(.footnote).foregroundColor(.gray)
                    Text(job.postedDate ?? "").lineLimit(3).font(.caption)
                }
            }.padding()
        }
    }
}
