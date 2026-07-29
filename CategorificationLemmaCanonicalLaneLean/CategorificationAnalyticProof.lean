import CategorificationLemmaCanonicalLaneLean.CategorificationRoute

namespace HautevilleHouse
namespace CategorificationLemmaCanonicalLaneLean

structure CategorificationAnalyticCertificate (B : CategorificationObject) where
  categorificationFunctorConstructed : Prop
  homotopyCoherenceProved : Prop
  derivedExtComputed : Prop
  nondegeneracyVerified : Prop
  categorificationFunctorConstructedClosed : categorificationFunctorConstructed
  homotopyCoherenceProvedClosed : homotopyCoherenceProved
  derivedExtComputedClosed : derivedExtComputed
  nondegeneracyVerifiedClosed : nondegeneracyVerified
  categorificationEvidence : CategorificationEvidence B

def CategorificationAnalyticCertificateClosed {B : CategorificationObject}
    (C : CategorificationAnalyticCertificate B) : Prop :=
  C.categorificationFunctorConstructed ∧
  C.homotopyCoherenceProved ∧
  C.derivedExtComputed ∧
  C.nondegeneracyVerified ∧
  CategorificationClosed B

theorem categorification_analytic_certificate_closed
    {B : CategorificationObject} (C : CategorificationAnalyticCertificate B) :
    CategorificationAnalyticCertificateClosed C := by
  exact And.intro C.categorificationFunctorConstructedClosed
    (And.intro C.homotopyCoherenceProvedClosed
      (And.intro C.derivedExtComputedClosed
        (And.intro C.nondegeneracyVerifiedClosed
          (categorification_closed_from_evidence B C.categorificationEvidence))))

end CategorificationLemmaCanonicalLaneLean
end HautevilleHouse