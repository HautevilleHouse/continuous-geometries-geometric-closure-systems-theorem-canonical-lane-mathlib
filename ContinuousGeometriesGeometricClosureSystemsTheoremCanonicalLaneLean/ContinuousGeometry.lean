import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean.GeometricClosureSystem

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean

structure ContinuousGeometry (M : Type u) [TopologicalSpace M] where
  closureSystem : GeometricClosureSystem M
  latticeStructure : Prop
  meetContinuous : Prop
  joinContinuous : Prop
  latticeStructureClosed : latticeStructure
  meetContinuousClosed : meetContinuous
  joinContinuousClosed : joinContinuous

def ContinuousGeometryClosed (M : Type u) [TopologicalSpace M] (C : ContinuousGeometry M) : Prop :=
  GeometricClosureClosed C.closureSystem ∧ C.latticeStructure ∧ C.meetContinuous ∧ C.joinContinuous

theorem continuous_geometry_closed_from_fields (M : Type u) [TopologicalSpace M] (C : ContinuousGeometry M) :
    ContinuousGeometryClosed M C := by
  refine And.intro (geometric_closure_system_closed_from_fields C.closureSystem) ?_
  exact And.intro C.latticeStructure (And.intro C.meetContinuous C.joinContinuous)

end ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean
end HautevilleHouse