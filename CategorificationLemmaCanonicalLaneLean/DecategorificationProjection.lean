import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationLemmaCanonicalLaneLean

structure DecategorificationProjection (C D : Type u) where
  projectionFunctor : D → C
  projectionOnObjects : Prop
  projectionOnMorphisms : Prop

structure DecategorificationProjectionEvidence (C D : Type u) (P : DecategorificationProjection C D) where
  projectionOnObjectsClosed : P.projectionOnObjects
  projectionOnMorphismsClosed : P.projectionOnMorphisms

def DecategorificationProjectionClosed (C D : Type u) (P : DecategorificationProjection C D) : Prop :=
  P.projectionOnObjects ∧ P.projectionOnMorphisms

theorem decategorification_projection_closed_from_evidence (C D : Type u) (P : DecategorificationProjection C D)
    (E : DecategorificationProjectionEvidence C D P) : DecategorificationProjectionClosed C D P :=
  And.intro E.projectionOnObjectsClosed E.projectionOnMorphismsClosed

end CategorificationLemmaCanonicalLaneLean
end HautevilleHouse