import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean

structure ContinuousGeometrySteinerPackage where
  L : GeometricClosureSystem
  steinerOperator : Type u → Type u → Type u
  associative : ∀ X Y Z : Type u, steinerOperator (steinerOperator X Y) Z = steinerOperator X (steinerOperator Y Z)
  continuousInEachArg : ∀ (f : ℕ → Type u), steinerOperator (⋃ n, f n) Y = ⋃ n, steinerOperator (f n) Y
  geometricSteiner : ∀ X : Type u, steinerOperator X X = X

structure ContinuousGeometrySteinerEvidence (S : ContinuousGeometrySteinerPackage) where
  associativeClosed : S.associative
  continuousInEachArgClosed : S.continuousInEachArg
  geometricSteinerClosed : S.geometricSteiner

def ContinuousGeometrySteinerClosed (S : ContinuousGeometrySteinerPackage) : Prop :=
  S.associative ∧ S.continuousInEachArg ∧ S.geometricSteiner

theorem continuous_geometry_steiner_closed_from_evidence (S : ContinuousGeometrySteinerPackage) (E : ContinuousGeometrySteinerEvidence S) : ContinuousGeometrySteinerClosed S := by
  exact And.intro E.associativeClosed (And.intro E.continuousInEachArgClosed E.geometricSteinerClosed)

end ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean
end HautevilleHouse