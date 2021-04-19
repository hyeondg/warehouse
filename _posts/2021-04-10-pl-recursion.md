---
layout: post
title:  Recursion
tags: PL
open: true
mathjax: on
---

### Recursive functions

Let's define a simple recursive function, which computes the sum from \\(0\\) to \\(n\\).
```swift
func sum(_ x: Int) -> Int {
    if (x == 0) { 
        return 0
    }
    else {
        return (x + sum(x - 1))
    }
}
```
We cannot define the **value** in the same way, since the free identifier error occurs. 
```swift
let sum = { (x: Int) -> Int in  
    if (x == 0) {
        return 0
    }
    else {
        return x + sum(x - 1)
    }
}
```
Now, we define `RFAE`, defining recursive functions. 

$$ \frac{\sigma \vdash e_1 \implies 0 \quad \sigma \vdash e_2 \implies v}{\sigma \vdash \texttt{if0} \, e_1 \, e_2 \, e_3 \implies v} $$

$$ \frac{\sigma \vdash e_1 \implies v' \quad v' \neq 0 \quad \sigma \vdash e_3 \implies v}{\sigma \vdash \texttt{if0} \, e_1 \, e_2 \, e_3 \implies v} $$

$$ \frac{\sigma' = \sigma[ x_1 \to \langle \lambda x_2 . e_1, \sigma ' \rangle] \quad \sigma' \vdash e_2 \implies v }{\sigma  \vdash \texttt{def} \, x_1 (x_2) = e_1; \, e_2 \implies v} $$



*All the materials are from CS320 class held on KAIST, 2021 spring.*