//
//  BaseViewController.swift
//  StarWarsExample
//
//  Created by Angie Mugo on 26/07/2021.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {
    var disposeBag = DisposeBag()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configureNavigationBar(_ title: String?) {
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        self.title = title
    }

    func showErrorAlert(_ title: String, _ description: String, _ action: @escaping ((UIAlertAction) -> Void)) {
        guard !description.isEmpty else { return }
        let alert = UIAlertController(title: title, message: description, preferredStyle:.alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: action)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
