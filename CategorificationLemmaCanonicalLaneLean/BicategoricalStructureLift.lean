import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategorificationLemmaCanonicalLaneLean.MonoidalStructureLift

namespace HautevilleHouse
namespace CategorificationLemmaCanonicalLaneLean

structure BicategoricalStructureLift (C : Type u) where
  horizontalComposition : ∀ (X Y Z : C), (X → Y) → (Y → Z) → (X → Z)
  verticalComposition : ∀ (X Y : C), (X → Y) → (X → Y) → (X → Y)
  associator : ∀ (X Y Z W : C) (f : X → Y) (g : Y → Z) (h : Z → W), 
    horizontalComposition (horizontalComposition f g) h → horizontalComposition f (horizontalComposition g h)
  unitors : Prop
  associatorNaturality : Prop
  pentagonIdentity : Prop

structure BicategoricalStructureLiftEvidence (C : Type u) (B : BicategoricalStructureLift C) where
  associatorNaturalityClosed : B.associatorNaturality
  pentagonIdentityClosed : B.pentagonIdentity

def BicategoricalStructureLiftClosed (C : Type u) (B : BicategoricalStructureLift C) : Prop :=
  B.associatorNaturality ∧ B.pentagonIdentity

theorem bicategorical_structure_lift_closed_from_evidence (C : Type u) (B : BicategoricalStructureLift C)
    (E : BicategoricalStructureLiftEvidence C B) : BicategoricalStructureLiftClosed C B :=
  And.intro E.associatorNaturalityClosed E.pentagonIdentityClosed

end CategorificationLemmaCanonicalLaneLean
end HautevilleHouse