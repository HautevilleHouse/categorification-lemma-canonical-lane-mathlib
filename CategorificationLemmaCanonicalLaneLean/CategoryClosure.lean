import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationLemmaCanonicalLaneLean

structure CategoryClosurePackage where
  objectSet : Prop
  arrowCategory : Prop
  compositionDefined : Prop
  associativityLaw : Prop
  identityExists : Prop

structure CategoryClosureEvidence (P : CategoryClosurePackage) where
  objectSetClosed : P.objectSet
  arrowCategoryClosed : P.arrowCategory
  compositionDefinedClosed : P.compositionDefined
  associativityLawClosed : P.associativityLaw
  identityExistsClosed : P.identityExists

def CategoryClosureClosed (P : CategoryClosurePackage) : Prop :=
  P.objectSet ∧ P.arrowCategory ∧ P.compositionDefined ∧ P.associativityLaw ∧ P.identityExists

theorem category_closure_closed_from_evidence (P : CategoryClosurePackage) (E : CategoryClosureEvidence P) : CategoryClosureClosed P := by
  exact And.intro E.objectSetClosed
    (And.intro E.arrowCategoryClosed
      (And.intro E.compositionDefinedClosed
        (And.intro E.associativityLawClosed E.identityExistsClosed)))

end CategorificationLemmaCanonicalLaneLean
end HautevilleHouse
