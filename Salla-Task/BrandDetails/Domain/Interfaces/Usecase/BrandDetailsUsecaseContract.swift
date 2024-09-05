//
//  BrandDetailsUsecaseContract.swift
//  Salla-Task
//
//  Created by Amr Ahmed on 05/09/2024.
//

import Foundation
import Combine

protocol BrandDetailsUsecaseContract {
    
    func excute(page: Int, perPage: Int) -> AnyPublisher<BaseResponse<[Product]>, Error>
}
