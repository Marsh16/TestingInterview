//
//  Job.swift
//  TestingInterview
//
//  Created by Marsha Likorawung on 09/12/24.
//

import Foundation

// MARK: - JobElement
struct Job: Codable, Identifiable {
    let id: String? // Optional id property
    let jobVacancyCode: String
    let positionName: String
    let corporateId: String
    let corporateName: String
    let status: String
    let descriptions: String
    let corporateLogo: String
    let applied: String?
    let salaryFrom: Int
    let salaryTo: Int
    let postedDate: String?
}
