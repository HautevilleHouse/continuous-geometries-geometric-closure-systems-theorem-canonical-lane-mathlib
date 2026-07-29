import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean

structure IrreducibleClosurePackage where
  L : GeometricClosureSystem
  irreducibleSet : Type u → Prop
  irreducibleDecomposition : ∀ X : Type u, ∃ (I : Set (Set X)), (∀ s ∈ I, irreducibleSet s) ∧ closureOperator X = closureOperator (⋃ s ∈ I, s)
  uniqueness : ∀ X : Type u, ∀ (I J : Set (Set X)), (∀ s ∈ I, irreducibleSet s) → (∀ t ∈ J, irreducibleSet t) → closureOperator X = closureOperator (⋃ s ∈ I, s) → closureOperator X = closureOperator (⋃ t ∈ J, t) → I = J
  continuousIrreducible : ∀ (f : ℕ → Type u), irreducibleSet (⋃ n, f n) ↔ ∀ n, irreducibleSet (f n)

structure IrreducibleClosureEvidence (I : IrreducibleClosurePackage) where
  irreducibleDecompositionClosed : I.irreducibleDecomposition
  uniquenessClosed : I.uniqueness
  continuousIrreducibleClosed : I.continuousIrreducible

def IrreducibleClosureClosed (I : IrreducibleClosurePackage) : Prop :=
  I.irreducibleDecomposition ∧ I.uniqueness ∧ I.continuousIrreducible

theorem irreducible_closure_closed_from_evidence (I : IrreducibleClosurePackage) (E : IrreducibleClosureEvidence I) : IrreducibleClosureClosed I := by
  exact And.intro E.irreducibleDecompositionClosed (And.intro E.uniquenessClosed E.continuousIrreducibleClosed)

end ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean
end HautevilleHouse