import UIKit


enum EngineState {
    
    case on, off
    
}

enum WindowState {
    
    case isOpen, isClose
    
}


enum TrunkState {
    
    case isOpen, isClose
    
}

enum ActionWCar {
    
    case turnOffEngine, turnOnEngine, openWindow, closeWindow, putInTrunkValue, unloadFromTrunkValue, openTrunc, closeTrunk
    
}

struct SportCar{
    
    let carModel: String
    let yearProduction: String
    let valueTrunk: Double
    var engineState: EngineState = .off
    var windowState: WindowState = .isClose
    var trunkState: TrunkState = .isClose
    
    var valueLoadTrunk: Double = 0
    
    
    
    mutating func Action (en: ActionWCar, let valueOfGoods: Double = 0) {
        
        switch en {
        
        case .turnOnEngine:
            if engineState == .off {
                
                print("Включаем двигатель")
                engineState = .on
                
            } else {
                
                print("Двигатель уже запущен")
                
            }
        case .turnOffEngine:
            if engineState == .on {
                
                print("Выключаем двигатель")
                engineState = .off
                print("Двигатель выключен")
                
            } else {
                
                print("Двигатель выключен")
                
            }
        case .openWindow:
            if windowState == .isClose {
                
                print("Открываем окно")
                windowState = .isOpen
                print("Окно открыто")
                
            } else {
                
                print("Окно открыто")
                
            }
        case .closeWindow:
            if windowState == .isOpen {
                
                print("Закрываем окно")
                windowState = .isClose
                print("Окно закрыто")
                
            } else {
                
                print("Окно закрыто")
                
            }
        case .openTrunc:
            if trunkState == .isClose {
                
                print("Открываем багажник")
                trunkState = .isOpen
                print("Багажник открыт")
                
            } else {
                
                print("Багажник открыт")
                
            }
        case .closeTrunk:
            if trunkState == .isOpen {
                
                print("Закрываем багажник")
                trunkState = .isClose
                print("Багажник закрыт")
                
            } else {
                
                print("Багажник закрыт")
                
            }
        case .putInTrunkValue:
            if valueTrunk == 0 {
               
                print("Опция багажника не предоставлена")
                
            } else if valueOfGoods > valueTrunk {
                
                print("Объем груза слишком велик, вы можете положить \(valueOfGoods - valueTrunk)")
                
            } else {
                
                if trunkState == .isOpen {
                    
                    valueLoadTrunk = valueTrunk - valueOfGoods
                    
                    print ("Груз помещен в багажник. ")
                    
                } else {
                    
                    print("Багажник закрыт")
                    
                }
                
            }
            
        case .unloadFromTrunkValue:
            if trunkState == .isOpen {
                
                valueLoadTrunk -= valueOfGoods
                
                print ("Груз извлечен из багажника. ")
                
            } else {
                
                print("Багажник закрыт")
                
            }
            
        
        }
        
    }
            
}
    
var car1 = SportCar(carModel: "Honda", yearProduction: "2000", valueTrunk: 50)


car1.Action(en: .openTrunc)
car1.Action(en: .putInTrunkValue, let: 25)

