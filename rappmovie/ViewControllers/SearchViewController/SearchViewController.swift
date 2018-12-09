//
//  SearchViewController.swift
//  rappmovie
//
//  Created by Emiliano Bivachi on 12/6/18.
//  Copyright © 2018 BaxLabs. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SearchViewController: CollectionViewController {

    @IBOutlet private var navigationView: UIView!
    @IBOutlet private var searchContainerView: UIView!
    @IBOutlet private var searchTextField: UITextField!

    private let viewModel = SearchViewModel()
    private var disposeBag = DisposeBag()

    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }

    init() {
        super.init(nibName: "SearchViewController", bundle: nil)
        modalPresentationStyle = .overFullScreen
        modalTransitionStyle = .crossDissolve
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .clear
        view.addBlurEffect(style: .dark)
        navigationView.addBlurEffect(style: .dark)

        searchContainerView.backgroundColor = Styler.Color.darkGray.withAlphaComponent(0.5)
        searchContainerView.layer.cornerRadius = 5
        
        searchTextField.textColor = Styler.Color.darkWhite
        searchTextField.attributedPlaceholder = NSAttributedString(string: "Search for movies and tv shows", attributes: [NSAttributedString.Key.foregroundColor: UIColor(white: 1.0, alpha: 0.5)])


        collectionView.backgroundColor = .clear
        collectionView.register(MediaCollectionCell.self)
        collectionView.register(LoadingCollectionCell.self)
        
        searchTextField.rx.text
            .throttle(0.4, latest: true, scheduler: MainScheduler.instance)
            .subscribe(onNext: {
                self.viewModel.resetPage()
                self.viewModel.query = $0
            })
            .disposed(by: disposeBag)

        let _ = viewModel.state.asObservable()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] state in
                self?.stateHasChanged(state)
            })
    }

    @IBAction func dismiss() {
        searchTextField.resignFirstResponder()
        dismiss(animated: true)
    }

    func stateHasChanged(_ state: StateViewModel.State) {

        switch state {
        case .initial: break
        case .loading: break
        case .error: break
        case .success(let sections):
            self.results = sections
        }
    }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {

    var margin: CGFloat { return 12 }
    var cellWidth: CGFloat { return (UIScreen.main.bounds.width - margin * 4) / 3 }
    var cellHeight: CGFloat { return cellWidth * 1.5 }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let row = rowAtIndexPath(indexPath)
        if row is LoadingCollectionRow {
            return CGSize(width: UIScreen.main.bounds.width - margin * 2, height: 100)
        }
        return CGSize(width: cellWidth, height: cellHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return margin
    }
}

extension SearchViewController: MediaRowDelegate {

    func actionDidRequesToOpen(media: Media) {
        let vc = MediaViewController(media: media)
        present(vc, animated: true)
    }
}

extension SearchViewController: LoadingRowDelegate {

    func actionDidRequestToLoadMore() {
        viewModel.loadMore()
    }
}
