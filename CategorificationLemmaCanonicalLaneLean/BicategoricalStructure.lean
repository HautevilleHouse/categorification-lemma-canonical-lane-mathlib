import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationLemmaCanonicalLaneLean

structure BicategoricalStructurePackage where
  objects : Type u
  oneCells : objects → objects → Type v
  twoCells : ∀ {a b}, oneCells a b → oneCells a b → Type w
  horizontalComposition : ∀ {a b c}, oneCells a b → oneCells b c → oneCells a c
  verticalComposition : ∀ {a b} {f g h : oneCells a b}, twoCells f g → twoCells g h → twoCells f h
  associativity : Prop
  identityTwoCells : ∀ {a b} (f : oneCells a b), twoCells f f
  coherence : Prop

structure BicategoricalStructureEvidence (B : BicategoricalStructurePackage) where
  associativityClosed : B.associativity
  identityTwoCellsClosed : ∀ {a b} (f : B.oneCells a b), B.twoCells f f
  coherenceClosed : B.coherence

def BicategoricalStructureClosed (B : BicategoricalStructurePackage) : Prop :=
  B.associativity ∧ B.coherence

theorem bicategorical_structure_closed_from_evidence (B : BicategoricalStructurePackage) (E : BicategoricalStructureEvidence B) :
    BicategoricalStructureClosed B := by
  exact And.intro E.associativityClosed E.coherenceClosed

end CategorificationLemmaCanonicalLaneLean
end HautevilleHouse