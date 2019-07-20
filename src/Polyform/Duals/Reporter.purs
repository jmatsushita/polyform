module Polyform.Duals.Reporter where

import Prelude

import Polyform.Dual (Dual, dual, parser, serializer) as Dual
import Polyform.Reporter (R, Reporter, hoistValidator, hoistValidatorWith, hoistValidatorWith') as Reporter
import Polyform.Reporter (runReporter) as Reproter
import Polyform.Reporter.Par as Reporter.Par
import Polyform.Validator (Validator) as Validator

type Dual m r i o = Dual.Dual (Reporter.Reporter m r) i o

newtype Par m r a b = Dual (Reporter.Par.Par m r a b)

runReporter ∷ ∀ r i m o. Dual.Dual (Reporter.Reporter m r) i o → (i → m (Reporter.R r o))
runReporter = Reproter.runReporter <<< Dual.parser

-- | Dirty hack to simplify type inference for polymorphic duals
runSerializer ∷ ∀ i o m r. Applicative m ⇒ Dual m r i o → (o → m i)
runSerializer = map pure <<< Dual.serializer

hoistValidatorWith ∷ ∀ e i m o r
  . Functor m
  ⇒ (e → r)
  → (o → r)
  → Dual.Dual (Validator.Validator m e) i o
  → Dual m r i o
hoistValidatorWith fe fo d = Dual.dual
  (Reporter.hoistValidatorWith fe fo $ Dual.parser d)
  (Dual.serializer d)

hoistValidatorWith' ∷ ∀ i m o r
  . Functor m
  ⇒ (o → r)
  → Dual.Dual (Validator.Validator m r) i o
  → Dual m r i o
hoistValidatorWith' fo d = Dual.dual
  (Reporter.hoistValidatorWith' fo $ Dual.parser d)
  (Dual.serializer d)

hoistValidator ∷ ∀ i m o r
  . Functor m
  ⇒ Monoid r
  ⇒ Dual.Dual (Validator.Validator m r) i o
  → Dual m r i o
hoistValidator d = Dual.dual
  (Reporter.hoistValidator $ Dual.parser d)
  (Dual.serializer d)

