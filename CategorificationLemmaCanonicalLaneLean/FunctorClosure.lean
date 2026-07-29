import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationLemmaCanonicalLaneLean

structure FunctorClosurePackage where
  objectMap : Prop
  arrowMap : Prop
  functoriality : Prop
  identityPreserved : Prop
  compositionPreserved : Prop

structure FunctorClosureEvidence (F : FunctorClosurePackage) where
  objectMapClosed : F.objectMap
  arrowMapClosed : F.arrowMap
  functorialityClosed : F.functoriality
  identityPreservedClosed : F.identityPreserved
  compositionPreservedClosed : F.compositionPreserved

def FunctorClosureClosed (F : FunctorClosurePackage) : Prop :=
  F.objectMap ∧ F.arrowMap ∧ F.functoriality ∧ F.identityPreserved ∧ F.compositionPreserved

theorem functor_closure_closed_from_evidence (F : FunctorClosurePackage) (E : FunctorClosureEvidence F) : FunctorClosureClosed F := by
  exact And.intro E.objectMapClosed
    (And.intro E.arrowMapClosed
      (And.intro E.functorialityClosed
        (And.intro E.identityPreservedClosed E.compositionPreservedClosed)))

end CategorificationLemmaCanonicalLaneLean
end HautevilleHouse
