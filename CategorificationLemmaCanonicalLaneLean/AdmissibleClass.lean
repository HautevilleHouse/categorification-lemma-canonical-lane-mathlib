import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationLemmaCanonicalLaneLean

structure CategorificationObject where
  baseCategory : Type u
  targetCategory : Type v
  functor : baseCategory → targetCategory
  fullness : Prop
  faithfulness : Prop
  essentialSurjectivity : Prop

structure AdmissibleClass where
  object : CategorificationObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  CategorificationWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CategorificationLemmaCanonicalLaneLean
end HautevilleHouse