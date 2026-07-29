import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationLemmaCanonicalLaneLean

structure EquivalenceClosurePackage where
  forwardFunctor : Prop
  backwardFunctor : Prop
  unitNaturalIsomorphism : Prop
  counitNaturalIsomorphism : Prop
  triangleIdentities : Prop

structure EquivalenceClosureEvidence (E : EquivalenceClosurePackage) where
  forwardFunctorClosed : E.forwardFunctor
  backwardFunctorClosed : E.backwardFunctor
  unitNaturalIsomorphismClosed : E.unitNaturalIsomorphism
  counitNaturalIsomorphismClosed : E.counitNaturalIsomorphism
  triangleIdentitiesClosed : E.triangleIdentities

def EquivalenceClosureClosed (E : EquivalenceClosurePackage) : Prop :=
  E.forwardFunctor ∧ E.backwardFunctor ∧ E.unitNaturalIsomorphism ∧ E.counitNaturalIsomorphism ∧ E.triangleIdentities

theorem equivalence_closure_closed_from_evidence (E : EquivalenceClosurePackage) (Ev : EquivalenceClosureEvidence E) :
  EquivalenceClosureClosed E := by
  exact And.intro Ev.forwardFunctorClosed
    (And.intro Ev.backwardFunctorClosed
      (And.intro Ev.unitNaturalIsomorphismClosed
        (And.intro Ev.counitNaturalIsomorphismClosed Ev.triangleIdentitiesClosed)))

end CategorificationLemmaCanonicalLaneLean
end HautevilleHouse
