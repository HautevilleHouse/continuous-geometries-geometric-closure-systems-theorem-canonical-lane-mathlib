import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean

structure ClosureSystemPackage where
  closureOperator : Type u
  closedSets : Type v
  exchangeProperty : Prop
  geometricLattice : Prop
  atomistic : Prop

structure ClosureSystemEvidence (C : ClosureSystemPackage) where
  exchangePropertyClosed : C.exchangeProperty
  geometricLatticeClosed : C.geometricLattice
  atomisticClosed : C.atomistic

def ClosureSystemClosed (C : ClosureSystemPackage) : Prop :=
  C.exchangeProperty ∧ C.geometricLattice ∧ C.atomistic

theorem closure_system_closed_from_evidence (C : ClosureSystemPackage) (E : ClosureSystemEvidence C) :
    ClosureSystemClosed C := by
  exact And.intro E.exchangePropertyClosed (And.intro E.geometricLatticeClosed E.atomisticClosed)

end ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean
end HautevilleHouse