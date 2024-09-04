//
//  BaseViewModel.swift
//  Lemonada
//
//  Created by Amr Elsayed on 09/07/2023.
//

import Foundation
import Combine

class BaseViewModel: ObservableObject {
    var cancellables: Set<AnyCancellable> = Set<AnyCancellable>()
    var navigator = PassthroughSubject<Void, Never>()
    @Published var isLoading: Bool = false
    @Published var textResponse:  String = ""
    @Published var textError:  String = ""
    @Published var showingErrorAlert = false
    @Published var showingSuccessAlert = false

}
