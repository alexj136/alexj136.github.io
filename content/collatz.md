Title: Visualising the Collatz Conjecture
Date: 2016-12-02 00:10
Category: Blog
Tags: mathematics, programming, java
Slug: collatz-graph-drawing
Authors: Alex Jeffery
Summary: Drawing Collatz Graphs with Java and Graphviz

The Collatz conjecture is arguably the easiest to understand unsolved problem in mathematics. It was famously said that "Mathematics may not be ready for such problems" [1], and yet the problem itself can be understood by anyone that understands simple arithmetic.

### Understanding the problem

We start by picking any whole number. In our example, we'll start with 17. We then apply the following rule: *If our number is even, divide it by 2. If it's odd, multiply it by 3 and then add 1*. Thus from 7 (an odd number) we reach 52, because (17 * 3) + 1 = 52.

    17 ─┤ 52

52 is even, so we divide by 2 to get 26.

    17 ─┤ 52 ─┤ 26

26 is even, so again we divide by 2 to get 13.

    17 ─┤ 52 ─┤ 26 ─┤ 13

13 is odd, so we divide by 3 and add 1 again, yielding 40:

    17 ─┤ 52 ─┤ 26 ─┤ 13 ─┤ 40

After doing this a few more times, we end up with this chain, ending in 1:

    17 ─┤ 52 ─┤ 26 ─┤ 13 ─┤ 40 ─┤ 20 ─┤ 10 ─┤ 5 ─┐
                                                 │
           ┌─────────────────────────────────────┘
           ┴
           16 ─┤ 8 ─┤ 4 ─┤ 2 ─┤ 1

Now something interesting happens. From 1, we go to 4:

    17 ─┤ 52 ─┤ 26 ─┤ 13 ─┤ 40 ─┤ 20 ─┤ 10 ─┤ 5 ─┐
                                                 │
           ┌─────────────────────────────────────┘
           ┴
           16 ─┤ 8 ─┤ 4 ─┤ 2 ─┤ 1 ─┤ 4

And from 4, we return to 2, and then to 1, and then to 4 again, forming a repeating pattern:

    17 ─┤ 52 ─┤ 26 ─┤ 13 ─┤ 40 ─┤ 20 ─┤ 10 ─┤ 5 ─┐
                                                 │
           ┌─────────────────────────────────────┘
           ┴
           16 ─┤ 8 ─┤ 4 ─┤ 2 ─┤ 1 ─┤ 4 ─┤ 2 ─┤ 1 ─┤ 4 ─┤ 2 ─┤ 1 ─┤ 4 ─┤ ...

Instead of drawing this as a chain, we can draw it as a graph, with a loop from 1 back to 4:

                                                              ┌─────────┐
                                                              ┴         │
    17 ─┤ 52 ─┤ 26 ─┤ 13 ─┤ 40 ─┤ 20 ─┤ 10 ─┤ 5 ─┤ 16 ─┤ 8 ─┤ 4 ─┤ 2 ─┤ 1

This graph above is what we call the *collatz graph* for 17. We can draw a collatz graph for any whole number. Here is the collatz graph for 6:

                                    ┌─────────┐
                                    ┴         │
    6 ─┤ 3 ─┤ 10 ─┤ 5 ─┤ 16 ─┤ 8 ─┤ 4 ─┤ 2 ─┤ 1

and for 20:

                                ┌─────────┐
                                ┴         │
    20 ─┤ 10 ─┤ 5 ─┤ 16 ─┤ 8 ─┤ 4 ─┤ 2 ─┤ 1

So far all our graphs have ended at 1. But here's a question: will the graph *always* end at 1, for every starting number? We do not know. And we can't just try every number, because there are infinitely many of them. This is the collatz conjecture: **Do all chains eventually lead to 1, regardless of the starting number?** We've tried lots of numbers. In fact, we've tried over 2<sup>60</sup> numbers, and so far they've all ended in 1. But no one has *proved* that all numbers end in 1. It's an open question. And it's likely we won't know the answer for a long time.

Most experts think that all numbers do eventually get down to 1, but there is also a possiblity that there is another cycle like the 1-2-4 cycle amongst the very large numbers. Numbers in such a cycle would never reach 1.

### Connecting graphs

You may have noticed that some numbers have common numbers in their graphs. This means that we can combine graphs together into trees. For example,  the graphs for 17 and 6 both contain 10, so we can 'splice them' at 10:

                                6 ─┤ 3 ─┐                     ┌─────────┐
                                        ┴                     ┴         │
    17 ─┤ 52 ─┤ 26 ─┤ 13 ─┤ 40 ─┤ 20 ─┤ 10 ─┤ 5 ─┤ 16 ─┤ 8 ─┤ 4 ─┤ 2 ─┤ 1

And here is the same tree spliced with the graph for 106:

                                6 ─┤ 3 ─┐                     ┌─────────┐
                                        ┴                     ┴         │
    17 ─┤ 52 ─┤ 26 ─┤ 13 ─┤ 40 ─┤ 20 ─┤ 10 ─┤ 5 ─┤ 16 ─┤ 8 ─┤ 4 ─┤ 2 ─┤ 1
                            ┬
    106 ─┤ 53 ─┤ 160 ─┤ 80 ─┘

### Having some fun

We can write a program to generate these graphs for us! Graphviz is a piece of software for generating image files from graphs. Here's a simple graphviz file that will generate the collatz graph for 5:

    digraph G {
        rankdir=LR
        5 -> 16;
        16 -> 8;
        8 -> 4;
        4 -> 2;
        2 -> 1;
        1 -> 4;
    }

The second line `rankdir=LR` just tells graphviz to draw the graph horizontally rather than vertically so that it looks nice on this webpage. Otherwise the code should be fairly intuitive. We just write down which numbers have an edge to which numbers.

Where `example.dot` is our graphviz file, we can run this command to generate an image file `example.png`:

    $ dot -Tpng example.dot -o example.png

And the following image is generated:

![a]({attach}images/collatz-simple-example.png)

It's pretty. But we can't make large graphs with graphviz alone, as we'd have to calculate the graph by hand in order to type it into graphviz. So the solution is to write some code to generate our graphviz file.

#### References

- [1] [Wikipedia page for the Collatz conjecture](https://en.wikipedia.org/wiki/Collatz_conjecture)
- [2] [This](https://www.youtube.com/watch?v=5mFpVDpKX70) excellent video by [Numberphile](https://www.youtube.com/user/numberphile)
