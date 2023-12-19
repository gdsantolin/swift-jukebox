class User {
    private let id: Int
    private let name: String
    private var money: Double
    private var age: Int?

    init(id: Int, name: String, money: Double, age: Int? = nil) {
        self.id = id
        self.name = name
        self.money = money
        self.age = age
    }

    func getId() -> Int {
        return id
    }

    func getName() -> String {
        return name
    }

    func getMoney() -> Double {
        return money
    }

    func getAge() -> Int? {
        return age
    }

    func deductMoney(amount: Double) throws {
        if amount > money {
            throw UserError.insufficientMoney
        }
        money -= amount
    }

}