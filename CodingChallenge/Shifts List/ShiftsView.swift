//
//  ShiftsView.swift
//  CodingChallenge
//
//  Created by Brady Miller on 4/7/21.
//

import SwiftUI

struct ShiftsView: View {

    @ObservedObject var viewModel: ShiftsViewViewModel
    @State var shiftDetail: Shift?

    var body: some View {
        NavigationView {
            content
                .navigationTitle("Shifts")
                .sheet(item: $shiftDetail) { shift in
                    NavigationView {
                        ShiftDetailsView(shift: shift)
                    }
                }
        }
        .onAppear(perform: viewModel.viewDidAppear)
    }

    @ViewBuilder
    private var content: some View {
        CollectionLoadingView(loadingState: viewModel.loadingState) {
            list(sections: $0)
        } empty: {
            Text("List is empty")
        } error: {
            Text("Error: \($0.localizedDescription)")
        }
    }

    @ViewBuilder
    private func list(sections: [ShiftSection]) -> some View {
        ScrollView {
            LazyVStack(spacing: 0, pinnedViews: .sectionHeaders) {
                ForEach(sections) { section in
                    sectionView(section)
                }
            }
        }
    }

    @ViewBuilder
    private func sectionView(_ section: ShiftSection) -> some View {
        Section {
            VStack(spacing: 16) {
                ForEach(section.shifts) { shift in
                    ShiftCardView(shift: shift)
                        .onTapGesture {
                            self.shiftDetail = shift
                        }
                }
            }
            .padding(16)
        } header: {
            HStack {
                Text(section.date, formatter: DateFormatter.dayOnly)
                    .font(.title3)
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(Color.white)
        }
    }
}

struct ShiftsView_Previews: PreviewProvider {

    static let serviceMock: ShiftsNetworkServiceProtocol = {
        let mock = ShiftsNetworkServiceProtocolMock()
        let shifts: [Shift] = (0...2).map { Shift.stub(shiftID: $0) }
        mock.getShiftsAddressTypeStartEndRadiusReturnValue = .stub(data: [ .stub(shifts: shifts),
                                                                           .stub(shifts: shifts) ])
        return mock
    }()

    static var previews: some View {
        Group {
            ShiftsView(viewModel: .init(service: serviceMock,
                                        loadingState: .loaded(content: ShiftsViewViewModel.LoadingMocks.shifts)))
                .previewDisplayName("Loaded")

            ShiftsView(viewModel: .init(service: serviceMock))
                .previewDisplayName("Loading")

            ShiftsView(viewModel: .init(service: serviceMock,
                                        loadingState: .error(NSError(domain: "", code: 1))))
                .previewDisplayName("Error")

            ShiftsView(viewModel: .init(service: serviceMock,
                                        loadingState: .empty))
            .previewDisplayName("Empty")
        }
    }
}
