//
//  MainScreenSwiftUIView.swift
//  VIP+State+Router
//
//  Created by FIX PRICE on 10/22/24.
//

import SwiftUI

struct MainScreenSwiftUIView: View {
    @ObservedObject var viewState: ViewState
    private let randomImageInteractor: RandomImageProtocol
    private let imagePreservationInteractor: ImagePreservationProtocol
    
    init(
        viewState: ViewState,
        randomImageInteractor: RandomImageProtocol,
        imagePreservationInteractor: ImagePreservationProtocol
    ) {
        self.viewState = viewState
        self.randomImageInteractor = randomImageInteractor
        self.imagePreservationInteractor = imagePreservationInteractor
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            if !viewState.isImageBeingLoaded,
               let data = viewState.imageData,
               let image = Image(data: data) {
                image
                    .frame(
                        width: Self.imageViewWidth,
                        height:  Self.imageViewWidth
                    )
            } else {
                if viewState.isImageBeingLoaded {
                    SpinnerView()
                } else {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(
                            width: Self.imageViewWidth,
                            height: Self.imageViewWidth
                        )
                }
            }
            VStack(spacing: 10) {
                Spacer()
                
                Button {
                    imagePreservationInteractor.persist(imageData: viewState.imageData )
                } label: {
                    ZStack {
                        Rectangle()
                        Text("Save image")
                            .foregroundStyle(Color.white)
                    }
                    .frame(height: 50)
                    .cornerRadius(20)
                }
                
                Button {
                    randomImageInteractor.loadRandomImage(category: .city)
                } label: {
                    ZStack {
                        Rectangle()
                        Text("Random image")
                            .foregroundStyle(Color.white)
                    }
                    .frame(height: 50)
                    .cornerRadius(20)
                }
            }
            .padding(.horizontal, 20)
        }
        .background(Color.green)
    }
}

fileprivate extension MainScreenSwiftUIView {
    static let imageViewWidth: CGFloat = UIScreen.main.bounds.width * 0.8
}

#Preview {
    let vs = ViewState()
    let api = ApiManager()
    let presenter = MainScreenPresenter(viewState: vs)
    let randomImageInteractor = RandomImageInteractor(
        presenter: presenter,
        apiManager: api
    )
    let repository = InternalRepository()
    let imagerPreservationInteractor = ImagePreservationInteractor(repository: repository, presenter: presenter)
    MainScreenSwiftUIView(
        viewState: vs,
        randomImageInteractor: randomImageInteractor,
        imagePreservationInteractor: imagerPreservationInteractor
    )
}
