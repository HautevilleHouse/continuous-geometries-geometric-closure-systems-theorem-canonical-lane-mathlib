import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean.DimensionTheory

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean

structure ContinuousDimension (G : ContinuousGeometrySystem) (gc : GeometricClosureSystem G) where
  dim : Set G.carrier → ℕ ∪ {⊤}
  monotone : ∀ s t, s ⊆ t → dim s ≤ dim t
  submodular : ∀ s t, dim (s ∪ t) + dim (s ∩ t) ≤ dim s + dim t
  closureInvariant : ∀ s, dim s = dim (G.closureOperator s)

def ContinuousDimensionClosed (G : ContinuousGeometrySystem) (gc : GeometricClosureSystem G) (cd : ContinuousDimension G gc) : Prop :=
  cd.monotone ∧ cd.submodular ∧ cd.closureInvariant

theorem continuous_dimension_closed_from_properties (G : ContinuousGeometrySystem) (gc : GeometricClosureSystem G) (cd : ContinuousDimension G gc) : ContinuousDimensionClosed G gc cd :=
  And.intro cd.monotone (And.intro cd.submodular cd.closureInvariant)

end ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean
end HautevilleHouse