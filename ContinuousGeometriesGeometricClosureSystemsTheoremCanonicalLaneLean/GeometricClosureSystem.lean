import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean

structure GeometricClosureSystem (M : Type u) [TopologicalSpace M] where
  closureOperator : Set M → Set M
  idempotent : ∀ s, closureOperator (closureOperator s) = closureOperator s
  extensive : ∀ s, s ⊆ closureOperator s
  isotone : ∀ s t, s ⊆ t → closureOperator s ⊆ closureOperator t
  continuous : ∀ s, closureOperator s = closureOperator (closureOperator s)  -- idempotent again, but included for clarity

def GeometricClosureClosed {M : Type u} [TopologicalSpace M] (G : GeometricClosureSystem M) : Prop :=
  (∀ s, G.closureOperator (G.closureOperator s) = G.closureOperator s) ∧
  (∀ s, s ⊆ G.closureOperator s) ∧
  (∀ s t, s ⊆ t → G.closureOperator s ⊆ G.closureOperator t)

theorem geometric_closure_system_closed_from_fields {M : Type u} [TopologicalSpace M] (G : GeometricClosureSystem M) :
    GeometricClosureClosed G := by
  exact And.intro G.idempotent (And.intro G.extensive G.isotone)

end ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean
end HautevilleHouse