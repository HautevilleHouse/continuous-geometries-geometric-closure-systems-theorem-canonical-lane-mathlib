import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean

structure ContinuousLatticeGeodesicPackage where
  carrierSet : Type u
  closureOperator : carrierSet → carrierSet → Prop
  idempotent : closureOperator a (closureOperator a b) = closureOperator a b
  extensivity : closureOperator a b = b → a ⊆ b
  isotonicity : a ⊆ b → closureOperator c a ⊆ closureOperator c b
  continuousJoin : Prop
  continuousMeet : Prop
  geometricDimension : Nat

structure ContinuousLatticeGeodesicEvidence (C : ContinuousLatticeGeodesicPackage) where
  idempotentClosed : C.idempotent
  extensivityClosed : C.extensivity
  isotonicityClosed : C.isotonicity
  continuousJoinClosed : C.continuousJoin
  continuousMeetClosed : C.continuousMeet
  geometricDimensionClosed : C.geometricDimension = 3

def ContinuousLatticeGeodesicClosed (C : ContinuousLatticeGeodesicPackage) : Prop :=
  C.idempotent ∧ C.extensivity ∧ C.isotonicity ∧ C.continuousJoin ∧ C.continuousMeet ∧ (C.geometricDimension = 3)

theorem continuous_lattice_geodesic_closed_from_evidence (C : ContinuousLatticeGeodesicPackage) (E : ContinuousLatticeGeodesicEvidence C) : ContinuousLatticeGeodesicClosed C := by
  exact And.intro E.idempotentClosed (And.intro E.extensivityClosed (And.intro E.isotonicityClosed (And.intro E.continuousJoinClosed (And.intro E.continuousMeetClosed E.geometricDimensionClosed))))

end ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean
end HautevilleHouse