extension Dictionary {
    static func += (lhs: inout Dictionary, rhs: Dictionary) {
        lhs.merge(rhs) { (_, new) in new }
    }

    static func + (lhs:  Dictionary, rhs: Dictionary) -> Dictionary {
        var ret = lhs
        ret.merge(rhs) { (_, new) in new }
        return ret
    }
}

func NumVOperation(_ op: (Int, Int) -> (Int), _ v1: Value, _ v2: Value) -> Value
{
    switch v1 {
        case .NumV(let n1):
            switch v2 {
                case .NumV(let n2):
                    let n = op(n1, n2)
                    return Value.NumV(n)
                default:
                    return Value.NumV(-1)
            }
        default:
            return Value.NumV(-1)
    }
}

let ADD = {(a:Int, b:Int) -> Int in return a+b}
let SUB = {(a:Int, b:Int) -> Int in return a-b}
