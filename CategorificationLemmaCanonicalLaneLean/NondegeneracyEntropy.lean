import CategorificationLemmaCanonicalLaneLean.CategorificationObjects

namespace HautevilleHouse
namespace CategorificationLemmaCanonicalLaneLean

structure NondegeneracyEntropyPackage {B : CategorificationObject} where
  extGroupFiniteness : Prop
  vanishingConditions : Prop
  lowerEntropyBound : Prop
  genericityCondition : Prop

structure NondegeneracyEntropyEvidence {B : CategorificationObject} (N : NondegeneracyEntropyPackage B) where
  extGroupFinitenessClosed : N.extGroupFiniteness
  vanishingConditionsClosed : N.vanishingConditions
  lowerEntropyBoundClosed : N.lowerEntropyBound
  genericityConditionClosed : N.genericityCondition

def NondegeneracyEntropyClosed {B : CategorificationObject} (N : NondegeneracyEntropyPackage B) : Prop :=
  N.extGroupFiniteness ∧ N.vanishingConditions ∧ N.lowerEntropyBound ∧ N.genericityCondition

theorem nondegeneracy_entropy_closed_from_evidence
    {B : CategorificationObject} (N : NondegeneracyEntropyPackage B) (E : NondegeneracyEntropyEvidence N) :
    NondegeneracyEntropyClosed N := by
  exact And.intro E.extGroupFinitenessClosed
    (And.intro E.vanishingConditionsClosed
      (And.intro E.lowerEntropyBoundClosed E.genericityConditionClosed))

end CategorificationLemmaCanonicalLaneLean
end HautevilleHouse