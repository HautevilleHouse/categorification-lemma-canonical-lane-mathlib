import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationLemmaCanonicalLaneLean

structure MonoidalCategorificationPackage where
  baseMonoidal : Type u
  targetMonoidal : Type v
  functor : baseMonoidal → targetMonoidal
  tensorPreservation : Prop
  unitPreservation : Prop
  associativityPreservation : Prop
  coherence : Prop

structure MonoidalCategorificationEvidence (M : MonoidalCategorificationPackage) where
  tensorPreservationClosed : M.tensorPreservation
  unitPreservationClosed : M.unitPreservation
  associativityPreservationClosed : M.associativityPreservation
  coherenceClosed : M.coherence

def MonoidalCategorificationClosed (M : MonoidalCategorificationPackage) : Prop :=
  M.tensorPreservation ∧ M.unitPreservation ∧ M.associativityPreservation ∧ M.coherence

theorem monoidal_categorification_closed_from_evidence (M : MonoidalCategorificationPackage) (E : MonoidalCategorificationEvidence M) :
    MonoidalCategorificationClosed M := by
  exact And.intro E.tensorPreservationClosed (And.intro E.unitPreservationClosed (And.intro E.associativityPreservationClosed E.coherenceClosed))

end CategorificationLemmaCanonicalLaneLean
end HautevilleHouse