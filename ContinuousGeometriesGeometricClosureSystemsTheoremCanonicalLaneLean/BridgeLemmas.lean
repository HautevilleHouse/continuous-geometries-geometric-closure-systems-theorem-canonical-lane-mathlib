import ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean.ContinuousGeometriesAdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  match A with
  | { object := _, endpointSatisfied := h, remainderRecorded := _, gateWitness := _ } => h

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  match A with
  | { object := _, endpointSatisfied := h, remainderRecorded := _, gateWitness := _ } => h

end ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean
end HautevilleHouse