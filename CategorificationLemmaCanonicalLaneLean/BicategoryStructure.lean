import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategorificationLemmaCanonicalLaneLean.CategoryObjects

namespace HautevilleHouse
namespace CategorificationLemmaCanonicalLaneLean

structure BicategoryStructure {Obj : Type u} (C : CategoryObject Obj) where
  twoMorphisms : Obj → Obj → Type v
  verticalComposition : ∀ a b (f g h : twoMorphisms a b), (g → h) → (f → g) → (f → h)
  horizontalComposition : ∀ a b c (f : twoMorphisms a b) (g : twoMorphisms b c), twoMorphisms a c
  associator : ∀ a b c d (f : twoMorphisms a b) (g : twoMorphisms b c) (h : twoMorphisms c d),
    horizontalComposition (horizontalComposition f g) h = horizontalComposition f (horizontalComposition g h)
  leftUnitor : ∀ a b (f : twoMorphisms a b), horizontalComposition (C.identity a) f = f
  rightUnitor : ∀ a b (f : twoMorphisms a b), horizontalComposition f (C.identity b) = f
  coherenceConditions : Prop
  coherenceConditionsTerm : coherenceConditions

def BicategoryStructureClosed {Obj : Type u} {C : CategoryObject Obj} (B : BicategoryStructure C) : Prop :=
  B.associator ∧ B.leftUnitor ∧ B.rightUnitor ∧ B.coherenceConditions

end CategorificationLemmaCanonicalLaneLean
end HautevilleHouse