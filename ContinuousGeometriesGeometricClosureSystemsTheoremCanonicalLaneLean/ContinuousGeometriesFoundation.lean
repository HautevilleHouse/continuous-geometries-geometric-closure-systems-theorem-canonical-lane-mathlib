import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean

structure ContinuousGeometriesFoundation where
  closureSystem : ClosureSystemPackage
  geometryBridge : ContinuousGeometryBridge
  representation : RepresentationTheoremPackage
  closureSystemEvidence : ClosureSystemEvidence closureSystem
  geometryBridgeEvidence : ContinuousGeometryBridgeEvidence geometryBridge
  representationEvidence : RepresentationTheoremEvidence representation

def ContinuousGeometriesFoundationClosed (F : ContinuousGeometriesFoundation) : Prop :=
  ClosureSystemClosed F.closureSystem ∧
  ContinuousGeometryBridgeClosed F.geometryBridge ∧
  RepresentationTheoremClosed F.representation

theorem continuous_geometries_foundation_closed_from_evidence (F : ContinuousGeometriesFoundation) :
    ContinuousGeometriesFoundationClosed F := by
  exact And.intro (closure_system_closed_from_evidence F.closureSystem F.closureSystemEvidence)
    (And.intro (continuous_geometry_bridge_closed_from_evidence F.geometryBridge F.geometryBridgeEvidence)
      (representation_theorem_closed_from_evidence F.representation F.representationEvidence))

end ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean
end HautevilleHouse