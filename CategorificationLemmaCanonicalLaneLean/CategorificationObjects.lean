import CategorificationLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationLemmaCanonicalLaneLean

structure CategorificationObject where
  underlyingCategory : Type u
  targetMorphism : underlyingCategory → underlyingCategory
  homotopyCoherence : Prop
  derivedExt : Nat → Type v
  categorificationData : ∃ (n : Nat), derivedExt n ≃ underlyingCategory

end CategorificationLemmaCanonicalLaneLean
end HautevilleHouse