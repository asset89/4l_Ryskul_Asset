//
//  main.swift
//  4l_Ryskul_Asset
//
//  Created by Asset Ryskul on 15.11.2021.
//

// MARK: - Перечисление состояние окон
enum WindowState: String {
    case open = "Окна открыты"         // открыто
    case close = "Окна закрыты"        // закрыто
}
// MARK: - Перечисление состояние двигателя
enum EngineState: String{
    case start = "Двигатель заведен"          // включен
    case stop = "Двигатель выключен"          // заглушен
}
// MARK: - Перечисление описывающее погрузку/выгрузку из кузова/багажника
enum TrunkStateFill {
    case fill_in        // погрузить
    case fill_of        // выгрузить
}

// MARK: - Класс Car для общего описания автомашин
class Car {
    /*-- Свойства --*/
    let model: String               // модель
    let releaseYear: Int            // год выпуска
    var windowState: WindowState    // состояние окон
    var engineState: EngineState    // состояние двигателя
    
    /*-- Инициализация класса --*/
    init(model: String, releaseYear: Int, windowState: WindowState, engineState: EngineState) {
        self.model = model
        self.releaseYear = releaseYear
        self.windowState = windowState
        self.engineState = engineState
    }
    
    /*-- Метод для открытия/закрытия окон --*/
    final func windowControl(_ state: WindowState) {
        self.windowState = state
        switch self.windowState {
            case .open:
                print(state.rawValue)
            case .close:
                print(state.rawValue)
        }
    }
    
    /*-- Метод для запуска/выключения двигателя --*/
    final func engineControl(_ state: EngineState) {
        self.engineState = state
        switch self.engineState {
            case .start:
                print(state.rawValue)
            case .stop:
                print(state.rawValue)
        }
    }
    
    /*-- Метод, который выводит надпись о движении автомашины --*/
    func drive() {
        print("Автомашина марки \(self.model) тронулся!")
    }
    
}

// MARK: - Класс для спортивной машины
class SportCar: Car {
    
    // свойство SportCar, максимальная скорость
    var maxSpeed: Int
    
    init(model: String, releaseYear: Int, windowState: WindowState, engineState: EngineState, maxSpeed: Int) {
        self.maxSpeed = maxSpeed
        super.init(model: model, releaseYear: releaseYear, windowState: windowState, engineState: engineState)
    }
    
    override func drive() {
        print("Спортивный автомобиль марки \(self.model) тронулся!")
    }
}

// MARK: - Структура для грузовой машины
class TrunkCar: Car {
    // свойство TrunkCar, обьем кузова
    var trunkVolume: Double

    /*-- Конструктор --*/
    init(model: String, releaseYear: Int, windowState: WindowState, engineState: EngineState, trunkVolume: Double) {
        self.trunkVolume = trunkVolume
        super.init(model: model, releaseYear: releaseYear, windowState: windowState, engineState: engineState)
    }
    
    override func drive() {
        print("Грузовик марки \(self.model) тронулся!")
    }
        
    /*-- Метод для погрузки/выгрузки из кузова/багажника груза с определенным обьемом --*/
    func fill_to_trunk(fill state: TrunkStateFill, capacity volume: Double) {
        switch state {
            case .fill_in:
                self.trunkVolume += volume
                print("Загружено в кузов груз обьемом в \(volume) л/кг*3, заполнено \(self.trunkVolume) л/кг*3 обьема")
            case .fill_of:
                self.trunkVolume -= volume
                print("Выгружено из кузова груз обьемом в \(volume) л/кг*3б , еще свободно \(self.trunkVolume) л/кг*3 обьема")
        }
    }
}

// MARK: - создаем обьекты классов SportCar и TrunkCar

/*--- обьект спортивного автомобиля ---*/
var sportCar = SportCar(model: "Nissan Skyline", releaseYear: 2020, windowState: .close, engineState: .start, maxSpeed: 300)
sportCar.drive()
print(sportCar.model)
print(sportCar.maxSpeed)
sportCar.engineControl(.stop)

print("\n")
/*--- обьект грузового автомобиля ---*/
var trunk = TrunkCar(model: "Kamaz", releaseYear: 2015, windowState: .open, engineState: .stop, trunkVolume: 50)
trunk.fill_to_trunk(fill: .fill_in, capacity: 50)
print(trunk.windowState.rawValue)
trunk.drive()
trunk.engineControl(.stop)
trunk.windowControl(.close)
