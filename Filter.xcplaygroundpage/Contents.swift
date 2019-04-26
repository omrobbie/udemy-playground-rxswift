import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let disposeBag = DisposeBag()

Observable.of("Elon", "Steve", "Jeff", "Mark", "Jack")
    .filter {
        //        $0.starts(with: "J")
        $0.contains(Character("a"))
    }
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)
