import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationLemmaCanonicalLaneLean

structure LiftingPropertyPackage where
  source : CategorificationObject
  target : CategorificationObject
  liftExistence : Prop
  liftUniqueness : Prop
  liftComposition : Prop

structure LiftingPropertyEvidence (L : LiftingPropertyPackage) where
  liftExistenceClosed : L.liftExistence
  liftUniquenessClosed : L.liftUniqueness
  liftCompositionClosed : L.liftComposition

def LiftingPropertyClosed (L : LiftingPropertyPackage) : Prop :=
  L.liftExistence ∧ L.liftUniqueness ∧ L.liftComposition

theorem lifting_property_closed_from_evidence (L : LiftingPropertyPackage) (E : LiftingPropertyEvidence L) :
    LiftingPropertyClosed L := by
  exact And.intro E.liftExistenceClosed (And.intro E.liftUniquenessClosed E.liftCompositionClosed)

end CategorificationLemmaCanonicalLaneLean
end HautevilleHouse