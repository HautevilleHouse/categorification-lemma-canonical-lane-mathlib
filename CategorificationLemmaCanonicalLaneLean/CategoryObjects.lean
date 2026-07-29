import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationLemmaCanonicalLaneLean

structure CategoryObject (Obj : Type u) where
  identity : Obj → Obj
  composition : Obj → Obj → Obj → Obj
  associativity : ∀ a b c d (f : a → b) (g : b → c) (h : c → d), composition (composition f g) h = composition f (composition g h)
  identityLeft : ∀ a b (f : a → b), composition identity f = f
  identityRight : ∀ a b (f : a → b), composition f identity = f

def CategoryObjectClosed {Obj : Type u} (C : CategoryObject Obj) : Prop :=
  C.associativity ∧ C.identityLeft ∧ C.identityRight

structure CategorifiedObject where
  underlyingType : Type u
  categoryStructure : CategoryObject underlyingType
  liftToHigherCategory : Prop
  liftToHigherCategoryTerm : liftToHigherCategory

def CategorifiedObjectClosed (O : CategorifiedObject) : Prop :=
  CategoryObjectClosed O.categoryStructure ∧ O.liftToHigherCategory

end CategorificationLemmaCanonicalLaneLean
end HautevilleHouse