import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationLemmaCanonicalLaneLean

structure AdjointPairCategory (A B : Type u) where
  leftAdjoint : A → B
  rightAdjoint : B → A
  unitCounitAdjunction : Prop

structure AdjointPairCategoryEvidence (A B : Type u) (C : AdjointPairCategory A B) where
  leftAdjointClosed : True
  rightAdjointClosed : True
  unitCounitAdjunctionClosed : C.unitCounitAdjunction

def AdjointPairCategoryClosed (A B : Type u) (C : AdjointPairCategory A B) : Prop :=
  C.unitCounitAdjunction

theorem adjoint_pair_category_closed_from_evidence (A B : Type u) (C : AdjointPairCategory A B)
    (E : AdjointPairCategoryEvidence A B C) : AdjointPairCategoryClosed A B C :=
  E.unitCounitAdjunctionClosed

end CategorificationLemmaCanonicalLaneLean
end HautevilleHouse