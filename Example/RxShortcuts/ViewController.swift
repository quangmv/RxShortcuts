//
//  ViewController.swift
//  RxShortcuts
//
//  Created by sunshinejr on 11/13/2016.
//  Copyright (c) 2016 sunshinejr. All rights reserved.
//

import RxCocoa
import RxShortcuts
import RxSwift
import UIKit

enum TestError: Error {
    case test
}

class ViewController: UIViewController {
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Observable shortcuts
        // ====================
        
        let driverSequence = Driver<Int>.of(5, 6, 7, 8)
        let sequence = Observable<Int>.of(1, 2, 3, 4)
        let errorSequence = Observable<Int>.error(TestError.test)
        
        driverSequence
            .doOnNext { number in
                print("driver doOnNext: \(number)")
            }
            .driveNext { number in
                print("driveNext: \(number)")
            }
            .disposed(by: disposeBag)
        
        driverSequence
            .doOnCompleted {
                print("driver doOnCompleted")
            }
            .driveCompleted {
                print("driveCompleted")
            }
            .disposed(by: disposeBag)
        
        sequence
            .doOnNext { number in
                print("doOnNext: \(number)")
            }
            .subscribeNext { number in
                print("subscribeNext: \(number)")
            }
            .disposed(by: disposeBag)
        
        sequence
            .doOnCompleted {
                print("doOnCompleted")
            }
            .subscribeCompleted {
                print("subscribeCompleted")
            }
            .disposed(by: disposeBag)
        
        errorSequence
            .doOnError { error in
                print("doOnError: \(error)")
            }
            .subscribeError { _ in
                print("subscribeError")
            }
            .disposed(by: disposeBag)
    }
}
