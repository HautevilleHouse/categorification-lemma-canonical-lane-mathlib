import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationLemmaCanonicalLaneLean

structure CategorificationStructureLift (C D : Type u) where
  objectMap : C → D
  morphismMap : ∀ (X Y : C), (X → Y) → (objectMap X → objectMap Y)
  compositionPreserved : Prop
  identityPreserved : Prop

structure CategorificationStructureLiftEvidence (C D : Type u) (L : CategorificationStructureLift C D) where
  compositionPreservedClosed : L.compositionPreserved
  identityPreservedClosed : L.identityPreserved

def CategorificationStructureLiftClosed (C D : Type u) (L : CategorificationStructureLift C D) : Prop :=
  L.compositionPreserved ∧ L.identityPreserved

theorem categorification_structure_lift_closed_from_evidence (C D : Type u) (L : CategorificationStructureLift C D)
    (E : CategorificationStructureLiftEvidence C D L) : CategorificationStructureLiftClosed C D L :=
  And.intro E.compositionPreservedClosed E.identityPreservedClosed

end CategorificationLemmaCanonicalLaneLean
end HautevilleHouse