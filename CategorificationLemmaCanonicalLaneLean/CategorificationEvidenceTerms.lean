import CategorificationLemmaCanonicalLaneLean.CategorificationAnalyticProof

namespace HautevilleHouse
namespace CategorificationLemmaCanonicalLaneLean

structure CategorificationEvidenceTerms {B : CategorificationObject} (C : CategorificationAnalyticCertificate B) where
  categorificationFunctorConstructed : C.categorificationFunctorConstructed
  homotopyCoherenceProved : C.homotopyCoherenceProved
  derivedExtComputed : C.derivedExtComputed
  nondegeneracyVerified : C.nondegeneracyVerified
  categorificationClosed : CategorificationClosed B

def CategorificationAnalyticCertificate.evidenceTerms {B : CategorificationObject}
    (C : CategorificationAnalyticCertificate B) : CategorificationEvidenceTerms C :=
  {
    categorificationFunctorConstructed := C.categorificationFunctorConstructedClosed
    homotopyCoherenceProved := C.homotopyCoherenceProvedClosed
    derivedExtComputed := C.derivedExtComputedClosed
    nondegeneracyVerified := C.nondegeneracyVerifiedClosed
    categorificationClosed := categorification_closed_from_evidence B C.categorificationEvidence
  }

end CategorificationLemmaCanonicalLaneLean
end HautevilleHouse