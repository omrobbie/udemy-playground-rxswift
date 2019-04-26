import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let disposeBag = DisposeBag()

let numberObservable = Observable.from([1, 2, 3, 4, 5])

let numberSubscriptieon = numberObservable.subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)
