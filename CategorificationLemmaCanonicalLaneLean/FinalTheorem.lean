import canonicalLaneMathlib.AdmissibleClass
import CategorificationLemmaCanonicalLaneLean.CategorificationStructure

namespace HautevilleHouse
namespace CategorificationLemmaCanonicalLaneLean

def ConstrainedCategorificationClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_categorification_endgame (A : AdmissibleClass) :
    ConstrainedCategorificationClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CategorificationLemmaCanonicalLaneLean
end HautevilleHouse