import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean

structure ContinuousGeometryDimensionPackage where
  L : GeometricClosureSystem
  dimensionTheory : Nat → Type u → Prop
  dimensionLaw : ∀ X : Type u, dimensionTheory (dimension X) X
  continuity : ∀ (f : ℕ → Type u), dimension (⋃ n, f n) = sup (dimension ∘ f)
  exchangeDimension : ∀ X : Type u, ∀ a b : X, dimension X = dimension (closureOperator ({a} ∪ {b}))

structure ContinuousGeometryDimensionEvidence (D : ContinuousGeometryDimensionPackage) where
  dimensionLawClosed : D.dimensionLaw
  continuityClosed : D.continuity
  exchangeDimensionClosed : D.exchangeDimension

def ContinuousGeometryDimensionClosed (D : ContinuousGeometryDimensionPackage) : Prop :=
  D.dimensionLaw ∧ D.continuity ∧ D.exchangeDimension

theorem continuous_geometry_dimension_closed_from_evidence (D : ContinuousGeometryDimensionPackage) (E : ContinuousGeometryDimensionEvidence D) : ContinuousGeometryDimensionClosed D := by
  exact And.intro E.dimensionLawClosed (And.intro E.continuityClosed E.exchangeDimensionClosed)

end ContinuousGeometriesGeometricClosureSystemsTheoremCanonicalLaneLean
end HautevilleHouse