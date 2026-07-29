import HautevilleHouse.ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean

structure ContinuousGeometryClosurePackage where
  geometricLattice : Type u
  closureOperator : (geometricLattice → geometricLattice) → Prop
  idempotent : closureOperator ∘ closureOperator = closureOperator
  extensive : ∀ A, A ≤ closureOperator A
  monotone : ∀ A B, A ≤ B → closureOperator A ≤ closureOperator B

def ContinuousGeometryClosureClosed (C : ContinuousGeometryClosurePackage) : Prop :=
  C.idempotent ∧ C.extensive ∧ C.monotone

theorem continuous_geometry_closure_package_closed (C : ContinuousGeometryClosurePackage) : ContinuousGeometryClosureClosed C :=
  And.intro C.idempotent (And.intro C.extensive C.monotone)

end ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean
end HautevilleHouse