import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let disposeBag = DisposeBag()

struct Game {
    var price: Variable<Double>
}

let overwatch = Game(price: Variable(59.99))
let starwhal = Game(price: Variable(19.99))

let gameSubject = PublishSubject<Game>()

//gameSubject.subscribe(onNext: {
//    print($0.price.value)
//})

gameSubject
    .flatMap {
        $0.price.asObservable()
    }
    .subscribe(onNext: {
        print("Game price: $\($0)")
    }).disposed(by: disposeBag)

gameSubject.onNext(overwatch)
gameSubject.onNext(starwhal)

overwatch.price.value = 14.99
