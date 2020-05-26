---
layout: post
title: "Minesweeper - a Python programming tutorial"
subtitle: TODO
date: 26th May 2020
tags: minesweeper, python, tutorial, beginner, game, simple
published: false
---

This is a tutorial on programming a simple minesweeper game in Python. It's
aimed at people who know a little Python already, and want to improve, or people
who know another programming language already and want to pick up Python. This
tutorial assumes you have basic familiarity with Python, but if you already know
another programming language well, you should be able to work out what's going
on. You will need to be able to do the following things in order to follow
along:
- Do simple things with strings - concatenate them, print them to command-line,
  test if two strings are equal.
- Generate random integers with a given range, e.g. between 0 and 19.
- Work with lists - add and remove at a given indices, concatenate, search for
  a given element, use two-dimensional lists (lists of lists).
- Write basic control flow code - for-loops, while-loops, if-then-else
  statements.
- Use variables.
- Define functions, call them, and return results from them.

If you can't do *all* these already, don't worry - follow along as much as you
can and look up what you don't understand.

If you can understand the code snippet below, and know how to run it, you know
enough to follow this tutorial. If there are pieces you don't understand, try
researching them and then come back. If you can understand the code, but don't
know how to run it, look for a tutorial on installing Python and then come back
once you have it working.

<!-- TODO: Load this from the file in _includes -->

    import random

    targetNumber = 6

    # Throw a 6-sided die, i.e. return a random number between 1 and 6
    # (inclusive), with equal probability for each number in that range.
    def throwDie():
        print("rolling...")
        rand = random.randint(1, 6)
        print(str(rand) + " thrown!")
        return rand

    # Throw a 6-sided die until the given target number comes up.
    # Return the total number of throws.
    def rollDieUntilTarget(target):
        if target < 1 or target > 6:
            print("Target number does not appear on 6-sided dice!")
            return -1
        print("Rolling until a " + str(target) + " comes up...")
        currentResult = throwDie()
        throws = 1
        while currentResult is not target:
            currentResult = throwDie()
            throws += 1
        return throws

    totalThrows = rollDieUntilTarget(targetNumber)
    if totalThrows is -1:
        print("Something went wrong.")
    else:
        print("Took " + str(totalThrows) + " throws to roll a " \
            + str(targetNumber) + ".")

This tutorial is designed to teach you about classes, inheritance and recursion.
You don't need to know about them in advance. Hopefully you'll pick up some
other stuff along the way too.

The tutorial works by asking you to write some code to solve a sub-problem,
after which you can come back and check your code against a solution. Then you
progress to the next sub-problem. You should not look at the solutions until
you've tried *really hard* to get your code to work, and looked up anything you
don't understand. If, after all, you can't get something to work, do get in
touch and I'll try to help.
