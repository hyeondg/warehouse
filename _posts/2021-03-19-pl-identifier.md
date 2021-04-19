---
layout: post
title:  Identifiers
tags: PL
open: true
mathjax: on
---

### Identifiers

We define `Env` to store the values of each variable. `Env` maps the name of the variable to the value of it. 

```swift
typealias Env = [String : Value]
```

There are only one possible type of value at this point; an integer. 

```swift
enum Value {
    case NumV(Int)
}
```

We define five arithmetic expressions.

```swift
indirect enum Expr {
    case Num(Int)
    case Add(Expr, Expr)
    case Sub(Expr, Expr)
    case Val(String, Expr, Expr)
    case Id(String)
}
```

We can implement the interpretation of each expressions like the following.

```swift
func interp(_ e: Expr, _ env: Env) -> Value
{
    switch e {
        case .Num(let n):
            return .NumV(n)
        case .Add(let l, let r):
            return NumVOperation(ADD, interp(l, env), interp(r, env))
        case .Sub(let l, let r):
            return NumVOperation(SUB, interp(l, env), interp(r, env))
        case .Val(let x, let i, let b):
            return interp(b, env + [x : interp(i, env)])
        case .Id(let x):
            return env[x]!
    }
}

```



*All the materials are from CS320 class held on KAIST, 2021 spring.*