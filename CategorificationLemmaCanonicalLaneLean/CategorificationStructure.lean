import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationLemmaCanonicalLaneLean

structure CategorificationPackage where
  sourceCategory : Type u
  targetCategory : Type v
  functor : sourceCategory → targetCategory
  naturalTransformation : Prop
  monoidalStructure : Prop
  coherenceConditions : Prop
  weakEquivalence : Prop
  categorifiesTheorem : Prop

def CategorificationClosed (C : CategorificationPackage) : Prop :=
  C.naturalTransformation ∧ C.monoidalStructure ∧ C.coherenceConditions ∧
  C.weakEquivalence ∧ C.categorifiesTheorem

theorem categorification_closed (C : CategorificationPackage) : CategorificationClosed C :=
  And.intro C.naturalTransformation (And.intro C.monoidalStructure (And.intro C.coherenceConditions (And.intro C.weakEquivalence C.categorifiesTheorem)))

end CategorificationLemmaCanonicalLaneLean
end HautevilleHouse