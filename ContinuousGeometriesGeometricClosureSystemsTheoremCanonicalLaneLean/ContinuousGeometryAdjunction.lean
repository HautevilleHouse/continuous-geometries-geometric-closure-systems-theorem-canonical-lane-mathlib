import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean

structure AdjunctionClosurePackage where
  L : GeometricClosureSystem
  M : GeometricClosureSystem
  leftAdjoint : Type u → Type u
  rightAdjoint : Type u → Type u
  adjunction : ∀ X (in L) Y (in M), leftAdjoint X ⊆ Y ↔ X ⊆ rightAdjoint Y
  continuityLeft : ∀ (f : ℕ → Type u), leftAdjoint (⋃ n, f n) = ⋃ n, leftAdjoint (f n)
  continuityRight : ∀ (f : ℕ → Type u), rightAdjoint (⋃ n, f n) = ⋃ n, rightAdjoint (f n)
  idempotentLeft : ∀ X, leftAdjoint (rightAdjoint (leftAdjoint X)) = leftAdjoint X
  idempotentRight : ∀ Y, rightAdjoint (leftAdjoint (rightAdjoint Y)) = rightAdjoint Y

structure AdjunctionClosureEvidence (A : AdjunctionClosurePackage) where
  adjunctionClosed : A.adjunction
  continuityLeftClosed : A.continuityLeft
  continuityRightClosed : A.continuityRight
  idempotentLeftClosed : A.idempotentLeft
  idempotentRightClosed : A.idempotentRight

def AdjunctionClosureClosed (A : AdjunctionClosurePackage) : Prop :=
  A.adjunction ∧ A.continuityLeft ∧ A.continuityRight ∧ A.idempotentLeft ∧ A.idempotentRight

theorem adjunction_closure_closed_from_evidence (A : AdjunctionClosurePackage) (E : AdjunctionClosureEvidence A) : AdjunctionClosureClosed A := by
  exact And.intro E.adjunctionClosed (And.intro E.continuityLeftClosed (And.intro E.continuityRightClosed (And.intro E.idempotentLeftClosed E.idempotentRightClosed)))

end ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean
end HautevilleHouse