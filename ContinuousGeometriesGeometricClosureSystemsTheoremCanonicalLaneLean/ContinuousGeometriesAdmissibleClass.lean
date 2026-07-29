import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean

structure ContinuousGeometryObject where
  carrier : Type
  complementRelation : carrier → carrier → Prop
  continuousRankFunction : carrier → ℝ
  rankContinuity : Prop
  closureSystem : Set (Set carrier)
  closureProperties : Prop

structure AdmissibleContinuousGeometry (A : AdmissibleClass) where
  geometry : ContinuousGeometryObject
  bridgeCondition : A.endpointSatisfied
  gateCondition : A.remainderRecorded
  closureWitness : bridgeCondition ∨ gateCondition

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∧ A.remainderRecorded

end ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean
end HautevilleHouse