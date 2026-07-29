import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategorificationLemmaCanonicalLaneLean.AdjointPairCategories
import HautevilleHouse.CategorificationLemmaCanonicalLaneLean.CategorificationStructureLift
import HautevilleHouse.CategorificationLemmaCanonicalLaneLean.DecategorificationProjection

namespace HautevilleHouse
namespace CategorificationLemmaCanonicalLaneLean

structure CategorificationLemmaPackage (C : Type u → Type v) where
  sourceCategory : Type u
  targetCategory : Type v
  categorificationFunctor : sourceCategory → targetCategory
  decategorificationFunctor : targetCategory → sourceCategory
  adjunctionEvidence : AdjointPairCategory sourceCategory targetCategory
  structureLiftEvidence : CategorificationStructureLift sourceCategory targetCategory
  projectionEvidence : DecategorificationProjection sourceCategory targetCategory

def ConstrainedCategorificationClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem categorification_endgame (A : AdmissibleClass) : ConstrainedCategorificationClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CategorificationLemmaCanonicalLaneLean
end HautevilleHouse