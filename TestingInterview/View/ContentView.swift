//
//  ContentView.swift
//  TestingInterview
//
//  Created by Marsha Likorawung on 09/12/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var jobViewModel : JobViewModel
    var body: some View {
        NavigationView {
            VStack {
                GeometryReader { geometry in
                    VStack {
                        ScrollView {
                            VStack(alignment: .leading, spacing: 15) {
                                if jobViewModel.isLoading {
                                    VStack {
                                        ProgressView()
                                    }.frame(minWidth: 0, maxWidth: .infinity)
                                }else if jobViewModel.jobs.count == 0 {
                                    VStack(spacing: 10) {
                                        Text("Still Empty Here!")
                                            .font(.title3)
                                            .fontWeight(.bold)
                                            .foregroundColor(.primary)
                                    }
                                    .padding(.top, 50)
                                }
                                else {
                                    ForEach(jobViewModel.jobs) { job in
                                        NavigationLink {
                                            JobDetailView(job: job).environmentObject(jobViewModel)
                                        } label: {
                                            LazyVStack {
                                                JobCard(job: job).environmentObject(jobViewModel)
                                            }
                                            .buttonStyle(PlainButtonStyle())
                                        }
                                    }
                                }
                            }
                            Spacer()
                        }
                        .padding(.vertical)
                    } .onAppear {
                        jobViewModel.getAllJob()
                    }
                }.navigationBarBackButtonHidden()
            }
        }
    }
}
