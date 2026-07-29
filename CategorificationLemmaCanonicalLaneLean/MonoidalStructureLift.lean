import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationLemmaCanonicalLaneLean

structure MonoidalStructureLift (C : Type u) where
  tensorProduct : C → C → C
  unitObject : C
  associator : ∀ (X Y Z : C), (tensorProduct (tensorProduct X Y) Z) → (tensorProduct X (tensorProduct Y Z))
  leftUnitor : ∀ (X : C), tensorProduct unitObject X → X
  rightUnitor : ∀ (X : C), tensorProduct X unitObject → X
  pentagonIdentity : Prop
  triangleIdentity : Prop

structure MonoidalStructureLiftEvidence (C : Type u) (M : MonoidalStructureLift C) where
  pentagonIdentityClosed : M.pentagonIdentity
  triangleIdentityClosed : M.triangleIdentity

def MonoidalStructureLiftClosed (C : Type u) (M : MonoidalStructureLift C) : Prop :=
  M.pentagonIdentity ∧ M.triangleIdentity

theorem monoidal_structure_lift_closed_from_evidence (C : Type u) (M : MonoidalStructureLift C)
    (E : MonoidalStructureLiftEvidence C M) : MonoidalStructureLiftClosed C M :=
  And.intro E.pentagonIdentityClosed E.triangleIdentityClosed

end CategorificationLemmaCanonicalLaneLean
end HautevilleHouse