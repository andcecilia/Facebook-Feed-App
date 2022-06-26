//
//  MainController.swift
//  Facebook-Feed-App
//
//  Created by Cecilia Andrea Pesce on 05/06/22.
//

import Foundation
import LBTATools
import UIKit

class PostCell: LBTAListCell<String> {
    
    let imageView = UIImageView(backgroundColor: .red)
    let nameLabel = UILabel(text: "Name Label")
    let dateLabel = UILabel(text: "Friday at 11:11AM")
    let postTextLabel = UILabel(text: "Here is my post text")
    //let imagegeViewGrid = UIView(backgroundColor: .yellow)
    
    
    let photosGridController = PhotosGridController()
    
    override func setupViews() {
        backgroundColor = .white
        
        stack(hstack(imageView.withHeight(40).withWidth(40),
                    stack(nameLabel,
                    dateLabel),
                     spacing: 8).padLeft(12).padRight(12).padTop(12),
        postTextLabel,
              photosGridController.view,
              spacing:8)
    }
}

class StoryHeader: UICollectionReusableView {
    
    let storiesController = StoriesController(scrollDirection: .horizontal)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
        
        stack(storiesController.view)
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    class StoryPhotoCell: LBTAListCell<String> {
       
        override var item: String! {
            didSet{
                imageView.image = UIImage(named:item)
            }
        }
        
        let imageView = UIImageView(image: nil, contentMode: .scaleAspectFill)
        let nameLabel = UILabel(text: "Cecilia", font: .boldSystemFont(ofSize: 14), textColor: .white)
        override func setupViews() {
            imageView.layer.cornerRadius = 10
            
            stack(imageView)
            
            setupGradientLayer()
            
            stack(UIView(),nameLabel).withMargins(.allSides(8))
        }
        let gradientLayer = CAGradientLayer()
        
        private func setupGradientLayer(){
            
            gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
            gradientLayer.locations = [0.7,1.1]
            layer.cornerRadius = 10
            clipsToBounds = true
            layer.addSublayer(gradientLayer)
        }
        override func layoutSubviews(){
            super.layoutSubviews()
            
            gradientLayer.frame = bounds
        }
    }
    
class StoriesController: LBTAListController<StoryPhotoCell,String>, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 100, height: view.frame.height - 24)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 12, bottom: 0, right: 12)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.items = ["cat with sunglasses and cap","cat with sunglasses and cap", "Pink_flower", "Pink_flower", "Pink_flower", "Pink_flower"]
    }
    }
    
}

class MainController: LBTAListHeaderController<PostCell, String, StoryHeader>,
    UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: 0, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 12, left: 0, bottom: 0, right: 0)
        
    }
    
    let fbLogoImageView = UIImageView(image: UIImage(named: "fb_logo"), contentMode: .scaleAspectFit)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .init(white: 0.9, alpha: 1)
        
        self.items = ["hello", "world", "1", "2"]
        
        setupNavBar()
    }
    
    //let fbLogoImageView = UIImageView(image: UIImage(named: "fb_logo"), contentMode: .scaleAspectFit)
    
        private func setupNavBar() {
        let width = view.frame.width - 120 - 16 - 60
        //navigationItem.title = "my nav bar 123"
        let titleView = UIView(backgroundColor: .clear)
        titleView.frame = .init(x: 0, y: 0, width: 200, height: 100)
        
        let searchButton = UIButton(title: "Search", titleColor: .black)
        
        titleView.hstack(fbLogoImageView.withWidth(120), UIView(backgroundColor: .clear).withWidth(200), searchButton)
        
        navigationItem.titleView = titleView
            
    }
    
    func viewWillDAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.navigationBar.transform = .identity
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let magicalSafeAreaTop: CGFloat = 88
        print(scrollView.contentOffset.y)
        
        let offset = scrollView.contentOffset.y + magicalSafeAreaTop
        
        let alpha: CGFloat = 1 - ((scrollView.contentOffset.y + magicalSafeAreaTop) / magicalSafeAreaTop)
        
        fbLogoImageView.alpha = alpha
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return .init(width: view.frame.width, height: 450)
        }
}

import SwiftUI
struct MainPreview: PreviewProvider {
    static var previews: some View {
//        Text("main preview")
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    struct ContainerView: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) -> UIViewController {
            return UINavigationController(rootViewController: MainController())
        }
        
        func updateUIViewController(_ uiViewController: MainPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) {
        }
}
}
