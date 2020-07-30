//
//  Collection+Shortcuts.swift
//  RxShortcuts
//
//  Created by sunshinejr on 25.11.2016.
//  Copyright (c) 2016 sunshinejr. All rights reserved.
//

import RxSwift

public extension Collection where Iterator.Element: ObservableType {
    
    /**
     Merges elements from all observable sequences in the given enumerable sequence into a single observable sequence.
     
     - seealso: [merge operator on reactivex.io](http://reactivex.io/documentation/operators/merge.html)
     
     - returns: The observable sequence that merges the elements of the observable sequences.
     */
    func merge() -> Observable<Self.Iterator.Element.Element> {
        return Observable.from(self).merge()
    }
    
    /**
     Concatenates all inner observable sequences, as long as the previous observable sequence terminated successfully.
     
     - seealso: [concat operator on reactivex.io](http://reactivex.io/documentation/operators/concat.html)
     
     - returns: An observable sequence that contains the elements of each observed inner sequence, in sequential order.
     */
    func concat() -> Observable<Self.Iterator.Element.Element> {
        return Observable.from(self).concat()
    }
}
