import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

var variable = Variable<String>("Hello!")

print(variable.value)

variable.asObservable().subscribe(onNext: {
    print($0)
})
