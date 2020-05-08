---
layout: post
title: So you want to mix monads?
subtitle: TODO
date: 6th July 2017
tags: monads, haskell, rwst, reader, writer, state, transformer, tutorial
published: false
---

<!-- began work on this on 06.07.2017 -->

You're a Haskell programmer. And not a terrible one. You know the basics. You've
been `map`ping and `foldl`ing for quite some time now, and you love it. You can
even do a `do` when the need presents itself. `Maybe`, `State` and `Except` are
your friends. But there's something that eludes you. A deeper understanding that
you sense when you read the work of other Haskellers.


    (>>=) :: Maybe a -> (a -> Maybe b) -> Maybe b

    (>>=) :: Monad m => MaybeT m a -> (a -> MaybeT m b) -> MaybeT m b

    newtype MaybeT m a = MaybeT { runMaybeT :: m (Maybe a) }
                  /   \
                 /     \
              * -> *    *

    (>>=) :: Monad m => (m (Maybe a)) -> (a -> m (Maybe b)) -> m (Maybe b)

    (MaybeT mma) >>= f = MaybeT $ do
        ma <- mma
        case ma of
            Nothing -> return Nothing
            Just a  -> f a
    return a = MaybeT $ return a

    <???>
        mma >>= \ma -> maybe (return Nothing) f
        mma >=> maybe (return Nothing) f
        (>>=) mma = mma (>=> maybe (return Nothing) f)
    </???>

    main = runMaybeT $ do
        name <- lift getLine
        if name == "" then
            MaybeT $ return Nothing)
        else
            lift $ putStrLn name
        putStrLn "Done!"
        return ()

Outermost transformer becomes innermost monad (when you unravel the stack).

    (>>=) :: [a] -> (a -> [b]) -> [b]

    (>>=) = flip ((concat .). map)
        where flip f a b = f b a

    [1, 2, 3] >>= (\x -> [x * 5, x - 100])

evaluates to

    [5, -99, 10, -98, 15, -97]

    newtype ListT m a = ListT { runListT: m [a] }

    newtype State s a = State { runState :: s -> (a, s) }

    newtype StateT s m a = StateT { runStateT :: s -> m (a, s) }

    instance Monad m => Monad (StateT s m ) where
        (>>=) :: Monad m => StateT s m a -> (a -> StateT s m b) -> StateT s m b
        (>>=) (StateT ssma) f = StateT $ \s -> do
            (a, s') <- ssma s
            StateT ssmb <- f a
            return (ssmb s')

    -- Everything fails
    StateT s (MaybeT Identity) a =~ s -> Maybe (a, s)

    -- Still get state during failure
    MaybeT (StateT s Identity) a =~ s -> (Maybe a, s)

    class MonadState m | m -> a where
        put :: a -> m ()
        get :: m a

    instance MonadState m => MonadState (MaybeT m) where
        get = lift get
        put a = lift (put a)
