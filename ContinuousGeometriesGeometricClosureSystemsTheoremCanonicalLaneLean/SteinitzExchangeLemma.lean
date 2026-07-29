import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean.ContinuousGeometryClosure

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean

structure Matroid (E : Type u) where
  independent : Set (Set E)
  emptyIndependent : ∅ ∈ independent
  hereditary : ∀ I J, I ∈ independent → J ⊆ I → J ∈ independent
  augmentation : ∀ I J, I ∈ independent → J ∈ independent → |J| < |I| → ∃ x ∈ I \ J, J ∪ {x} ∈ independent

theorem exchange_from_matroid (E : Type u) (M : Matroid E) (I : Set E) (x y : E) (hxI : x ∈ M.independent) (hyI : y ∉ I) :
    ∃ x' ∈ I ∪ {y}, (I \ {x'}) ∪ {x} ∈ M.independent :=
  sorry

def SteinitzExchangeClosed {E : Type u} (M : Matroid E) : Prop :=
  ∀ (I : Set E) (x y : E), x ∈ M.independent → y ∉ I →
    ∃ x' ∈ I ∪ {y}, (I \ {x'}) ∪ {x} ∈ M.independent

end ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean
end HautevilleHouse