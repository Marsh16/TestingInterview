//
//  JobViewModel.swift
//  TestingInterview
//
//  Created by Marsha Likorawung on 09/12/24.
//

import Foundation
import UIKit

class JobViewModel: ObservableObject{
    @Published var jobs = [Job]()
    @Published var isLoading = false
    @Published var result : String = ""

    private let jobRepository: JobRepository
    
    init(jobRepository: JobRepository = JobRepository()) {
        self.jobRepository = jobRepository
    }
    
    func getAllJob() {
        isLoading = true
        jobRepository.getAllJobs() { [weak self] job in
            guard let job = job else { return }
            DispatchQueue.main.async {
                self?.jobs = job
                self?.isLoading = false
                let _ = print("success")
            }
        }
    }
}
