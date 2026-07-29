import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationLemmaCanonicalLaneLean

structure NaturalTransformationClosurePackage where
  sourceFunctor : Prop
  targetFunctor : Prop
  componentSet : Prop
  naturalitySquares : Prop

structure NaturalTransformationClosureEvidence (N : NaturalTransformationClosurePackage) where
  sourceFunctorClosed : N.sourceFunctor
  targetFunctorClosed : N.targetFunctor
  componentSetClosed : N.componentSet
  naturalitySquaresClosed : N.naturalitySquares

def NaturalTransformationClosureClosed (N : NaturalTransformationClosurePackage) : Prop :=
  N.sourceFunctor ∧ N.targetFunctor ∧ N.componentSet ∧ N.naturalitySquares

theorem natural_transformation_closure_closed_from_evidence
  (N : NaturalTransformationClosurePackage) (E : NaturalTransformationClosureEvidence N) :
  NaturalTransformationClosureClosed N := by
  exact And.intro E.sourceFunctorClosed
    (And.intro E.targetFunctorClosed
      (And.intro E.componentSetClosed E.naturalitySquaresClosed))

end CategorificationLemmaCanonicalLaneLean
end HautevilleHouse
