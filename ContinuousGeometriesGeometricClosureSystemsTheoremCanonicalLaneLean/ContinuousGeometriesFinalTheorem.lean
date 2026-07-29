import ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean

def ConstrainedContinuousGeometriesClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_continuous_geometries_endgame (A : AdmissibleClass) :
    ConstrainedContinuousGeometriesClosure A :=
by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean
end HautevilleHouse