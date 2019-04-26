import RxSwift
import PlaygroundSupport
import Foundation

PlaygroundPage.current.needsIndefiniteExecution = true

let disposeBag = DisposeBag()

let formatter = NumberFormatter()

formatter.numberStyle = .spellOut

Observable<NSNumber>.of(123, 47, 9)
    .map {
        formatter.string(from: $0) ?? ""
    }
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)
