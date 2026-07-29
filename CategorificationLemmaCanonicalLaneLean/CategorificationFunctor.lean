import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategorificationLemmaCanonicalLaneLean.CategoryObjects
import HautevilleHouse.CategorificationLemmaCanonicalLaneLean.BicategoryStructure

namespace HautevilleHouse
namespace CategorificationLemmaCanonicalLaneLean

structure CategorificationFunctor (Obj1 Obj2 : Type u) (C1 : CategoryObject Obj1) (C2 : CategoryObject Obj2) where
  onObjects : Obj1 → Obj2
  onMorphisms : ∀ a b : Obj1, (a → b) → (onObjects a → onObjects b)
  preservesIdentity : ∀ a : Obj1, onMorphisms a a (C1.identity a) = C2.identity (onObjects a)
  preservesComposition : ∀ a b c (f : a → b) (g : b → c), onMorphisms a c (C1.composition f g) = C2.composition (onMorphisms a b f) (onMorphisms b c g)

def CategorificationFunctorClosed {Obj1 Obj2 : Type u} {C1 : CategoryObject Obj1} {C2 : CategoryObject Obj2}
    (F : CategorificationFunctor Obj1 Obj2 C1 C2) : Prop :=
  F.preservesIdentity ∧ F.preservesComposition

structure CategorificationAdjoint {Obj1 Obj2 : Type u} (C1 : CategoryObject Obj1) (C2 : CategoryObject Obj2) where
  leftAdjoint : CategorificationFunctor Obj1 Obj2 C1 C2
  rightAdjoint : CategorificationFunctor Obj2 Obj1 C2 C1
  unit : ∀ a : Obj1, (a → rightAdjoint.onObjects (leftAdjoint.onObjects a))
  counit : ∀ b : Obj2, (leftAdjoint.onObjects (rightAdjoint.onObjects b) → b)
  triangleIdentities : Prop
  triangleIdentitiesTerm : triangleIdentities

def CategorificationAdjointClosed {Obj1 Obj2 : Type u} {C1 : CategoryObject Obj1} {C2 : CategoryObject Obj2}
    (A : CategorificationAdjoint Obj1 Obj2 C1 C2) : Prop :=
  CategorificationFunctorClosed A.leftAdjoint ∧ CategorificationFunctorClosed A.rightAdjoint ∧ A.triangleIdentities

end CategorificationLemmaCanonicalLaneLean
end HautevilleHouse