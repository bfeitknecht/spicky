#import "../src/lib.typ": *

#show: conf.with(
  title: "My Cheatsheet",
  authors: ("Author Name",),
  description: "A compact calculus and discrete mathematics reference.",
  columns: 2,
)

= Calculus

== Limits and derivatives

#definition[Limit][
  $lim_(x -> a) f(x) = L$ when values of $f(x)$ approach $L$ as $x$ approaches $a$.
][
  For continuity at $a$, the limit must equal $f(a)$.
]

#example[Derivative from first principles][
  For $f(x) = x^2$, the difference quotient simplifies to:

  $ ( (x + h)^2 - x^2 ) / h = 2x + h -> 2x $
]

#recipe[Common derivatives][
  #grid[
    | *Function* | *Derivative* |
    | --- | --- |
    | $x^n$ | $n x^(n - 1)$ |
    | $sin x$ | $cos x$ |
    | $cos x$ | $-sin x$ |
    | $e^x$ | $e^x$ |
  ]
]

== Integration

#definition[Fundamental theorem][
  If $F'(x) = f(x)$, then $integral_a^b f(x) dif x = F(b) - F(a)$.
]

#recipe[Substitution][
  Set $u = g(x)$ and $dif u = g'(x) dif x$. Then integrate in $u$ and substitute back.
]

= Discrete mathematics

== Recurrences

#definition[Recurrence relation][
  A recurrence defines each term of a sequence from earlier terms, together with enough initial values to determine the sequence.
]

#example[Fibonacci numbers][
  $F_0 = 0$, $F_1 = 1$, and $F_n = F_(n - 1) + F_(n - 2)$ for $n >= 2$.

  #pseudo[
    + f0 := 0;
    + f1 := 1;
    + *for* i *in* 2 .. n *do*
      + f1 := f0 + f1;
      + f0 := f1 - f0;
    + *end*
  ]
]

== Counting

#recipe[Useful counting rules][
  #grid[
    | *Situation* | *Count* |
    | --- | --- |
    | Ordered choices without repetition | $n! / (n-k)!$ |
    | Unordered choices | $binom(n, k)$ |
    | Arrange $n$ distinct objects | $n!$ |
  ]
]

#definition[Binomial coefficient][
  $binom(n, k) = n! / (k! (n-k)!)$ counts the ways to choose $k$ items from $n$ distinct items when order does not matter.
]

= Linear algebra

== Matrix operations

#definition[Matrix product][
  For compatible matrices $A$ and $B$, the entry $(A B)_(i j)$ is the dot product of row $i$ of $A$ and column $j$ of $B$.
]

#example[Two-dimensional rotation][
  A counterclockwise rotation by $theta$ is represented by

  For a rotation, use $R = mat(cos theta, -sin theta; sin theta, cos theta)$ and compute the matrix-vector product.
]

#recipe[Useful identities][
  #grid[
    | *Operation* | *Identity* |
    | --- | --- |
    | Transpose | $(A B)^T = B^T A^T$ |
    | Determinant | $det(A B) = det(A) det(B)$ |
    | Inverse | $(A B)^(-1) = B^(-1) A^(-1)$ |
  ]
]

= Probability

== Conditional probability

#definition[Bayes' rule][
  For events $A$ and $B$ with $P(B) > 0$, $P(A | B) = (P(B | A) P(A)) / P(B)$.
]

#example[Independent events][
  If $A$ and $B$ are independent, then $P(A | B) = P(A)$ and $P(A and B) = P(A) P(B)$.
]

#recipe[Expectation rules][
  #grid[
    | *Rule* | *Result* |
    | --- | --- |
    | Scaling | $E(a X + b) = a E(X) + b$ |
    | Linearity | $E(X + Y) = E(X) + E(Y)$ |
    | Variance | $V(X) = E(X^2) - E(X)^2$ |
  ]
]
