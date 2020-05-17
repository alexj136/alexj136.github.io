---
layout: page
title: Publications
date: 14th April 2020
tags: alex, jeffery, research, publications, papers, bibliography
---

---

## _On Implicit Program Constructs_

Ph.D. Thesis, September 2019.

<details>
<summary>Abstract</summary>
<p>
Session types are a well-established approach to ensuring protocol conformance
and the absence of communication errors such as deadlocks in message passing
systems.
</p>
<p>
Implicit parameters, introduced by Haskell and popularised in Scala, are a
mechanism to improve program readability and conciseness by allowing the
programmer to omit function call arguments, and have the compiler insert them
in a principled manner at compile-time. Scala recently gave implicit types
first-class status (implicit functions),yielding an expressive tool for
handling context dependency in a type-safe manner.
</p>
<p>
DOT (Dependent Object Types) is an object calculus with path-dependent types
and abstract type members, developed to serve as a theoretical foundation for
the Scala programming language. As yet, DOT does not model all of Scala’s
features, but a small subset. Among those features of Scala not yet modelled by
DOT are implicit functions.
</p>
<p>
We ask: can type-safe implicit functions be generalised from Scala’s sequential
set-ting to message passing computation, to improve readability and conciseness
of message passing programs? We answer this question in the affirmative by
generalising the concept of an implicit function to an implicit message, its
concurrent analogue, a programming language construct for session-typed
concurrent computation.
</p>
<p>
We explore new applications for implicit program constructs by integrating them
into four novel calculi, each demonstrating a new use case or theoretical
result for implicits.
</p>
<p>
Firstly, we integrate implicit functions and messages into the concurrent
functional language LAST, Gay and Vasconcelos’s calculus of linear types for
asynchronous sessions. We demonstrate their utility by example, and explore use
cases for both implicit functions and implicit messages.
</p>
<p>
We integrate implicit messages into two pi calculi, further demonstrating the
robust-ness of our approach to extending calculi with implicits. We show that
implicit messages are possible in the absence of lambda calculus, in languages
with concurrency primitives only, and that they are sound not only in binary
session-typed computation, but also in multi-party context.
</p>
<p>
Finally we extend DOT to include implicit functions. We show type safety of the
resulting calculus by translation to DOT, lending a higher degree of confidence
to the correctness of implicit functions in Scala. We demonstrate that typical
use cases for implicit functions in Scala are typably expressible in DOT when
extended with implicit functions.
</p>
</details>

Links: [University of Sussex](http://sro.sussex.ac.uk/id/eprint/88307/1/Jeffery%2C%20Alexander%20Paul.pdf),
[British Library](https://ethos.bl.uk/OrderDetails.do?uin=uk.bl.ethos.801036)

---

## _Dependent Object Types with Implicit Functions_

Scala Symposium, 2019.

<details>
<summary>Abstract</summary>
DOT (Dependent Object Types) is an object calculus with path-dependent types
and abstract type members, developed to serve as a theoretical foundation for
the Scala programming language. As yet, DOT does not model all of Scala’s
features, but a small subset. We present the calculus DIF (DOT with Implicit
Functions), which extends the set of features modelled by DOT to include
implicit functions, a feature of Scala to aid modularity of programs. We show
type safety of DIF, and demonstrate that the generic programming focused use
cases for implicit functions in Scala are also expressible in DIF.
</details>

Link: [ACM](https://dl.acm.org/doi/pdf/10.1145/3337932.3338811)

---

## _Asynchronous Sessions with Implicit Functions and Messages_ <font size="4">(with <a href="http://users.sussex.ac.uk/~mfb21/">M. Berger</a>, Extended Version)</font>

Science of Computer Programming, 2019.

<details>
<summary>Abstract</summary>
Session types are a well-established approach to ensuring protocol conformance
and the absence of communication errors such as deadlocks in message passing
systems. Haskell introduced implicit parameters, Scala popularised this feature
and recently gave implicit types first-class status, yielding an expressive
tool for handling context dependencies in a type-safe yet terse way. We ask:
can type-safe implicit functions be generalised from Scala's sequential setting
to message passing computation? We answer this question in the affirmative by
generalising the concept of an implicit function to an <i>implicit message</i>,
its concurrent analogue. We present two calculi, each with implicit message
passing. The first, IM, is a concurrent functional language that extends Gay
and Vasconcelos's calculus of linear types for asynchronous sessions (LAST)
with implicit functions and messages. The second, MPIM, is a &pi;-calculus with
implicit messages that extends Coppo, Dezani-Ciancaglini, Padovani and
Yoshida's calculus of multiparty asynchronous sessions (MPST). We argue, via
examples, that these new language features provide utility to the programmer,
and prove each system sound by translation into its respective base calculus.
</details>

Link: [Science Direct](https://www.sciencedirect.com/science/article/pii/S0167642319300656)

---

## _Asynchronous Sessions with Implicit Functions and Messages_ <font size="4">(with <a href="http://users.sussex.ac.uk/~mfb21/">M. Berger</a>, Short Version)</font>

2018 International symposium on Theoretical Aspects of Software Engineering (TASE).

<details>
<summary>Abstract</summary>
Session types are a well-established approach to ensuring protocol conformance
and the absence of communication errors such as deadlocks in message passing
systems. Haskell introduced implicit parameters, Scala popularised this feature
and recently gave implicit types first-class status, yielding an expressive
tool for handling context dependencies in a type-safe yet terse way. We ask:
can type-safe implicit functions be generalised from Scala's sequential setting
to message passing computation? We answer this question in the affirmative by
presenting the first concurrent functional language with implicit message
passing. The key idea is to generalise the concept of an implicit function to
an <i>implicit message</i>, its concurrent analogue. Our language extends Gay
and Vasconcelos's calculus of linear types for asynchronous sessions (LAST)
with implicit functions and messages. We prove the resulting system sound by
translation into LAST.
</details>

Link: [University of Sussex](http://sro.sussex.ac.uk/77383/2/tase.pdf)
