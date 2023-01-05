//
//  ShiftsViewViewModel.swift
//  CodingChallenge
//
//  Created by Kacper Czapp on 05/01/2023.
//

import Foundation

final class ShiftsViewViewModel: ObservableObject {

    typealias LoadingState = CollectionLoadingState<[ShiftSection]>

    enum LoadingMocks {
        static let shifts: [ShiftSection] = .init(count: 3) { _ in
            ShiftSection(date: .init(),
                         shifts: .init(count: 3) { Shift.stub(shiftID: $0) } )
        }
    }

    let service: ShiftsNetworkServiceProtocol

    @Published var loadingState: LoadingState

    init(service: ShiftsNetworkServiceProtocol = ShiftsNetworkService(),
         loadingState: LoadingState = .loading(placeholder: LoadingMocks.shifts)) {
        self.service = service
        self.loadingState = loadingState
    }
    
    func viewDidAppear() {
        guard isRunningForPreviews == false else { return }

        Task(priority: .userInitiated) {
            await loadData()
        }
    }

    private func loadData() async {
        do {
            let data = try await service.getShifts(address: "Dallas, TX",
                                                   type: .week)
            let sections: [ShiftSection] = data.data.map { .init(date: $0.date, shifts: $0.shifts) }
            if sections.isEmpty {
                await self.setLoadingState(.empty)
            } else {
                await self.setLoadingState(.loaded(content: sections))
            }
        } catch {
            await self.setLoadingState(.error(error))
        }
    }

    private func setLoadingState(_ newValue: LoadingState) async {
        await MainActor.run {
            self.loadingState = newValue
        }
    }
}
